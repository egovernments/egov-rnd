
from __future__ import annotations
from typing import Dict, Tuple, List
import io, os, zipfile
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import re
from datetime import datetime, timedelta

DATE_RE = re.compile(r'(date|due|deadline|start|end)', re.I)
STATUS_RE = re.compile(r'(status|state|rag|progress|stage)', re.I)
OWNER_RE = re.compile(r'(owner|assignee|lead|manager)', re.I)
CAMPAIGN_RE = re.compile(r'(campaign|project|initiative|activity|program)', re.I)

def _find_col(cols, regex):
    import re as _re
    # Accept either compiled pattern or pattern string; ensure case-insensitive
    if isinstance(regex, _re.Pattern):
        pat = regex
    else:
        pat = _re.compile(regex, _re.I)
    out = []
    for c in cols:
        s = "" if c is None else str(c)
        if pat.search(s):
            out.append(c)
    return out

def kpis(dfs: Dict[str, pd.DataFrame]) -> Dict[str, int]:
    total_rows = sum(len(df) for df in dfs.values())
    total_sheets = len(dfs)
    total_campaigns = 0
    for df in dfs.values():
        cands = _find_col(df.columns, CAMPAIGN_RE)
        if cands:
            total_campaigns += df[cands[0]].nunique(dropna=True)
    return {"rows": total_rows, "sheets": total_sheets, "campaigns": int(total_campaigns)}

def status_breakdown(dfs: Dict[str, pd.DataFrame]) -> pd.Series:
    agg = []
    for df in dfs.values():
        sc = _find_col(df.columns, STATUS_RE)
        if sc:
            agg.append(df[sc[0]].astype(str))
    if not agg:
        return pd.Series(dtype=int)
    return pd.concat(agg, ignore_index=True).value_counts(dropna=False)

def owner_workload(dfs: Dict[str, pd.DataFrame]) -> pd.Series:
    agg = []
    for df in dfs.values():
        oc = _find_col(df.columns, OWNER_RE)
        if oc:
            agg.append(df[oc[0]].astype(str))
    if not agg:
        return pd.Series(dtype=int)
    return pd.concat(agg, ignore_index=True).value_counts(dropna=False)

def upcoming_deadlines(dfs: Dict[str, pd.DataFrame], days:int=30) -> pd.DataFrame:
    now = pd.Timestamp.now().normalize()
    soon = now + pd.Timedelta(days=days)
    rows: List[Dict[str, object]] = []
    for name, df in dfs.items():
        dc = _find_col(df.columns, DATE_RE)
        if not dc: 
            continue
        # Prefer "due/deadline/end"
        prefer = [c for c in dc if re.search(r'(due|deadline|end)', c, re.I)]
        col = prefer[0] if prefer else dc[0]
        s = pd.to_datetime(df[col], errors="coerce")
        mask = (s >= now) & (s <= soon)
        sub = df.loc[mask].copy()
        sub["__sheet__"] = name
        sub["__date__"] = s[mask]
        rows.append(sub)
    if not rows:
        return pd.DataFrame()
    out = pd.concat(rows, ignore_index=True)
    out = out.sort_values("__date__", ascending=True)
    return out

def gantt_dataframe(dfs: Dict[str, pd.DataFrame]) -> pd.DataFrame:
    """
    Build a simple Gantt table if there are start/end columns and a campaign/name column.
    """
    rows = []
    for name, df in dfs.items():
        dc = _find_col(df.columns, DATE_RE)
        if len(dc) < 2:
            continue
        start_cands = [c for c in dc if re.search(r'start', c, re.I)]
        end_cands = [c for c in dc if re.search(r'(end|due|deadline)', c, re.I)]
        if not start_cands or not end_cands:
            continue
        start_col = start_cands[0]
        end_col = end_cands[0]
        task_cands = _find_col(df.columns, CAMPAIGN_RE)
        if not task_cands:
            task_cands = [df.columns[0]]
        tmp = pd.DataFrame({
            "Task": df[task_cands[0]].astype(str),
            "Start": pd.to_datetime(df[start_col], errors="coerce"),
            "Finish": pd.to_datetime(df[end_col], errors="coerce"),
            "Sheet": name
        }).dropna(subset=["Start", "Finish"])
        rows.append(tmp)
    if rows:
        return pd.concat(rows, ignore_index=True)
    return pd.DataFrame()

def plot_series_bar(series: pd.Series, title: str):
    fig, ax = plt.subplots()
    series = series.head(15)
    series.plot(kind="bar", ax=ax)
    ax.set_title(title)
    ax.set_xlabel("")
    ax.set_ylabel("Count")
    fig.tight_layout()
    return fig

def create_share_pack(dfs: Dict[str, pd.DataFrame], include_dashboard_tabs=True) -> bytes:
    """
    Create a zip with:
      - kpis.json
      - status_breakdown.csv/png
      - owner_workload.csv/png
      - upcoming_deadlines.csv
      - each 'dashboard' sheet (if present) as CSV
    Returns zip bytes.
    """
    buf = io.BytesIO()
    with zipfile.ZipFile(buf, "w", zipfile.ZIP_DEFLATED) as z:
        # KPIs
        k = kpis(dfs)
        z.writestr("kpis.json", json_dumps(k))

        # Status
        sb = status_breakdown(dfs)
        if not sb.empty:
            z.writestr("status_breakdown.csv", sb.to_csv())
            fig = plot_series_bar(sb, "Status Breakdown")
            png = io.BytesIO()
            fig.savefig(png, format="png", bbox_inches="tight")
            z.writestr("status_breakdown.png", png.getvalue())

        # Owner
        ow = owner_workload(dfs)
        if not ow.empty:
            z.writestr("owner_workload.csv", ow.to_csv())
            fig2 = plot_series_bar(ow, "Owner Workload (Top 15)")
            png2 = io.BytesIO()
            fig2.savefig(png2, format="png", bbox_inches="tight")
            z.writestr("owner_workload.png", png2.getvalue())

        # Deadlines
        ud = upcoming_deadlines(dfs, 45)
        if not ud.empty:
            z.writestr("upcoming_deadlines.csv", ud.to_csv(index=False))

        # Dashboard tabs
        if include_dashboard_tabs:
            for name, df in dfs.items():
                if "dashboard" in name.lower():
                    z.writestr(f"dashboard/{name}.csv", df.to_csv(index=False))

        # Per-sheet CSV snapshots
        for name, df in dfs.items():
            z.writestr(f"snapshots/{name}.csv", df.to_csv(index=False))
    return buf.getvalue()

def json_dumps(obj) -> str:
    import json
    return json.dumps(obj, indent=2, default=str)
