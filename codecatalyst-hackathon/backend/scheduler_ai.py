# scheduler_ai.py
import re
import pandas as pd
from typing import Dict, List, Any
from campaign_analytics import _find_column

MONTH_RE = re.compile(r"^(Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec)\s+\d{4}$", re.I)

def _active_month_columns(df: pd.DataFrame) -> List[str]:
    return [c for c in df.columns if MONTH_RE.match(str(c).strip())]

def _infer_window_from_months(row: pd.Series, month_cols: List[str]) -> Dict[str, Any]:
    """Infer (start, end) from filled month cells."""
    filled = [m for m in month_cols if pd.notna(row.get(m)) and str(row.get(m)).strip() != ""]
    if not filled:
        return {}
    # Convert month headers to timestamps at month start/end
    months = [pd.to_datetime("01 " + m, errors="coerce") for m in filled]
    months = [m for m in months if pd.notna(m)]
    if not months:
        return {}
    return {
        "start": min(months),
        "end": (max(months) + pd.offsets.MonthEnd(0)),
        "months": filled,
    }

def detect_conflicts(dfs: Dict[str, pd.DataFrame]) -> Dict[str, Any]:
    """
    Detect schedule overlaps using either explicit Start/End columns or month columns.
    Returns a structured JSON with conflicts and data quality notes.
    """
    if not dfs:
        return {"message": "No data loaded."}

    df = list(dfs.values())[0].copy()
    name_col = _find_column(df, ["campaign name"])
    if not name_col:
        return {"message": "Missing 'Campaign Name' column."}

    country_col = _find_column(df, ["country"])
    start_col = _find_column(df, ["start", "begin"])
    end_col = _find_column(df, ["end", "finish"])
    month_cols = _active_month_columns(df)

    # Build normalized intervals
    intervals: List[Dict[str, Any]] = []
    for _, row in df.iterrows():
        name = str(row.get(name_col, "")).strip()
        if not name:
            continue
        country = str(row.get(country_col, "")).strip() if country_col else ""
        start, end = None, None

        if start_col and end_col:
            start = pd.to_datetime(row.get(start_col), errors="coerce")
            end = pd.to_datetime(row.get(end_col), errors="coerce")

        if (pd.isna(start) or pd.isna(end)) and month_cols:
            guess = _infer_window_from_months(row, month_cols)
            if guess:
                start = guess.get("start", start)
                end = guess.get("end", end)

        if pd.isna(start) or pd.isna(end):
            continue

        intervals.append({"name": name, "country": country, "start": start, "end": end})

    conflicts: List[Dict[str, Any]] = []
    intervals.sort(key=lambda x: (x["country"], x["start"], x["end"], x["name"]))

    for i in range(len(intervals)):
        a = intervals[i]
        for j in range(i + 1, len(intervals)):
            b = intervals[j]
            # If country present, check overlaps within same country; else global
            if a["country"] and b["country"] and a["country"] != b["country"]:
                continue
            if a["end"] < b["start"]:
                # since sorted by start, we can break for same country bucket
                if a["country"] == b["country"]:
                    break
            # Overlap condition
            if not (a["end"] < b["start"] or b["end"] < a["start"]):
                conflicts.append(
                    {
                        "a_campaign": a["name"],
                        "b_campaign": b["name"],
                        "country": a["country"] or b["country"],
                        "a_window": [a["start"].date().isoformat(), a["end"].date().isoformat()],
                        "b_window": [b["start"].date().isoformat(), b["end"].date().isoformat()],
                    }
                )

    return {
        "conflict_count": len(conflicts),
        "conflicts": conflicts[:200],  # safety cap
        "notes": {
            "intervals_considered": len(intervals),
            "used_month_columns": bool(month_cols),
            "requires_columns": ["Campaign Name", "Start/End OR Month columns"],
        },
    }
