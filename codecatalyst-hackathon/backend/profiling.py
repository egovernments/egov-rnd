from __future__ import annotations
from typing import Dict, List, Tuple
import pandas as pd
import numpy as np
import re
from datetime import datetime

DATE_LIKE = re.compile(r"(date|deadline|due|end|start|closed|created|updated)", re.I)
OWNER_LIKE = re.compile(r"(owner|assignee|assigned|manager|lead)", re.I)
STATUS_LIKE = re.compile(r"(status|state|rag|progress|stage)", re.I)
CAMPAIGN_LIKE = re.compile(r"(campaign|project|program|initiative|activity)", re.I)

def profile_sheet(df: pd.DataFrame) -> pd.DataFrame:
    rows = []
    for col in df.columns:
        s = df[col]
        dtype = str(s.dtype)
        non_null = int(s.notna().sum())
        nunique = int(s.nunique(dropna=True))
        sample = s.dropna().head(3).tolist()
        rows.append({
            "column": col,
            "dtype": dtype,
            "non_null": non_null,
            "unique": nunique,
            "sample": sample
        })
    return pd.DataFrame(rows)

def coerce_dates(df: pd.DataFrame) -> pd.DataFrame:
    out = df.copy()
    for col in df.columns:
        if DATE_LIKE.search(col):
            out[col] = pd.to_datetime(out[col], errors="coerce")
    return out

def quick_insights(dfs: Dict[str, pd.DataFrame]) -> Dict[str, Dict[str, object]]:
    """
    Return per-sheet insights: counts by status, owners, upcoming deadlines.
    """
    insights = {}
    for name, df in dfs.items():
        if df.empty:
            insights[name] = {"note": "Empty sheet"}
            continue
        dfx = coerce_dates(df)
        status_cols = [c for c in dfx.columns if STATUS_LIKE.search(c)]
        owner_cols = [c for c in dfx.columns if OWNER_LIKE.search(c)]
        date_cols = [c for c in dfx.columns if DATE_LIKE.search(c)]
        camp_cols = [c for c in dfx.columns if CAMPAIGN_LIKE.search(c)]

        out = {}
        if status_cols:
            col = status_cols[0]
            out["status_counts"] = dfx[col].value_counts(dropna=False).to_dict()
        if owner_cols:
            col = owner_cols[0]
            out["top_owners"] = dfx[col].value_counts(dropna=False).head(10).to_dict()
        if date_cols:
            # upcoming within 30 days if 'due/deadline/end'
            due_like = [c for c in date_cols if re.search(r"(due|deadline|end)", c, re.I)]
            if due_like:
                col = due_like[0]
                now = pd.Timestamp.now().tz_localize(None)
                soon = now + pd.Timedelta(days=30)
                mask = (pd.to_datetime(dfx[col], errors="coerce") >= now) & (pd.to_datetime(dfx[col], errors="coerce") <= soon)
                out["upcoming_30d"] = int(mask.sum())
        if camp_cols:
            col = camp_cols[0]
            out["campaigns"] = dfx[col].dropna().unique().tolist()[:50]

        insights[name] = out or {"note": "No campaign-like signals detected"}
    return insights
