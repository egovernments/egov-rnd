from __future__ import annotations
from typing import Dict, List
import os
import pandas as pd
import numpy as np
from prompts import SYSTEM_PROMPT, USER_INSTRUCTION_TEMPLATE

OPENAI_AVAILABLE = False
try:
    import openai  # type: ignore
    OPENAI_AVAILABLE = True
except Exception:
    OPENAI_AVAILABLE = False

def _sample_tables_for_context(dfs: Dict[str, pd.DataFrame], max_rows_per_sheet: int = 60, max_chars: int = 12000) -> str:
    """Create a compact textual context from a dict of DataFrames."""
    parts: List[str] = []
    for name, df in dfs.items():
        if df.empty:
            continue
        head = df.head(max_rows_per_sheet)
        csv = head.to_csv(index=False)
        snippet = f"[Sheet: {name}]\n{csv}\n"
        parts.append(snippet)
    text = "\n".join(parts)
    if len(text) > max_chars:
        text = text[:max_chars] + "\n... (truncated)"
    return text

def answer_question(question: str, dfs: Dict[str, pd.DataFrame]) -> str:
    context = _sample_tables_for_context(dfs)
    if not context.strip():
        return "I couldn't find any rows to analyze. Please load a sheet or pick a different tab."

    if OPENAI_AVAILABLE and os.getenv("OPENAI_API_KEY"):
        openai.api_key = os.getenv("OPENAI_API_KEY")
        messages = [
            {"role": "system", "content": SYSTEM_PROMPT},
            {"role": "user", "content": USER_INSTRUCTION_TEMPLATE.format(context=context, question=question)},
        ]
        try:
            # gpt-4o-mini or gpt-4.1 if accessible
            resp = openai.ChatCompletion.create(model="gpt-4o-mini", messages=messages, temperature=0.2)
            return resp["choices"][0]["message"]["content"].strip()
        except Exception as e:
            return f"(AI error) {e}\n\nFallback sample-based answer:\n\n" + _fallback_answer(question, dfs)
    else:
        return _fallback_answer(question, dfs)

def _fallback_answer(question: str, dfs: Dict[str, pd.DataFrame]) -> str:
    """Heuristic/non-LLM fallback for a few common asks."""
    q = question.lower()
    # very simple heuristics: search for words like "campaign", "status", "owner", "deadline"
    import re
    import pandas as pd

    def try_counts(col_regex, what):
        for name, df in dfs.items():
            cols = [c for c in df.columns if re.search(col_regex, c, re.I)]
            if cols:
                vc = df[cols[0]].value_counts(dropna=False).head(10).to_string()
                return f"In sheet '{name}', top {what}:\n{vc}"
        return None

    if "status" in q:
        ans = try_counts(r"(status|state|rag|progress|stage)", "statuses")
        if ans: return ans
    if "owner" in q or "assignee" in q:
        ans = try_counts(r"(owner|assignee|assigned|manager|lead)", "owners")
        if ans: return ans
    if "campaign" in q or "project" in q:
        for name, df in dfs.items():
            cols = [c for c in df.columns if re.search(r"(campaign|project|initiative|program|activity)", c, re.I)]
            if cols:
                uniq = df[cols[0]].dropna().unique()[:20]
                return f"In sheet '{name}', found campaigns/projects: {', '.join(map(str, uniq))}"
    if "deadline" in q or "due" in q:
        for name, df in dfs.items():
            cols = [c for c in df.columns if re.search(r"(deadline|due|end|target|finish)", c, re.I)]
            if cols:
                s = pd.to_datetime(df[cols[0]], errors="coerce")
                soon = s[s >= pd.Timestamp.now()].sort_values().head(10).dropna()
                return f"Upcoming deadlines from '{name}':\n{soon.to_string(index=False)}"
    # default
    return "I need clearer cues (status/owner/campaign/deadline columns). Try asking e.g. 'Show RAG by campaign for October'."
