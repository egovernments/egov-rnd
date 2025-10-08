# qa_engine.py
from __future__ import annotations
from typing import Dict, List
import os
import pandas as pd

from prompts import SYSTEM_PROMPT, USER_INSTRUCTION_TEMPLATE

# Optional OpenAI
OPENAI_AVAILABLE = False
try:
    import openai  # type: ignore
    OPENAI_AVAILABLE = True
except Exception:
    OPENAI_AVAILABLE = False


def _sample_tables_for_context(
    dfs: Dict[str, pd.DataFrame],
    max_rows_per_sheet: int = 60,
    max_chars: int = 12000,
) -> str:
    """Create a compact textual context from a dict of DataFrames."""
    parts: List[str] = []
    for name, df in dfs.items():
        if df.empty:
            continue
        # sanitize column names for readability
        df2 = df.copy()
        df2.columns = [str(c).replace("\n", " ").strip() for c in df2.columns]
        head = df2.head(max_rows_per_sheet)
        csv = head.to_csv(index=False)
        parts.append(f"[Sheet: {name}]\n{csv}\n")
    text = "\n".join(parts)
    if len(text) > max_chars:
        text = text[:max_chars] + "\n... (truncated)"
    return text


def answer_question(question: str, dfs: Dict[str, pd.DataFrame]) -> str:
    """LLM-backed answer with a robust fallback."""
    context = _sample_tables_for_context(dfs)
    if not context.strip():
        return "I couldn't find any rows to analyze. Please load a sheet or pick a different tab."

    # Use OpenAI if available & configured
    if OPENAI_AVAILABLE and os.getenv("OPENAI_API_KEY"):
        try:
            openai.api_key = os.getenv("OPENAI_API_KEY")
            model = os.getenv("OPENAI_MODEL", "gpt-4o-mini")
            messages = [
                {"role": "system", "content": SYSTEM_PROMPT},
                {
                    "role": "user",
                    "content": USER_INSTRUCTION_TEMPLATE.format(
                        context=context, question=question
                    ),
                },
            ]
            resp = openai.ChatCompletion.create(
                model=model, messages=messages, temperature=0.2
            )
            return resp["choices"][0]["message"]["content"].strip()
        except Exception as e:
            return f"(AI error) {e}\n\nFallback answer:\n\n" + _fallback_answer(
                question, dfs
            )

    # Fallback
    return _fallback_answer(question, dfs)


def _fallback_answer(question: str, dfs: Dict[str, pd.DataFrame]) -> str:
    """Heuristic fallback for common asks (status/owner/campaign/deadline)."""
    import re
    q = question.lower()

    def try_counts(col_regex, what):
        for name, df in dfs.items():
            cols = [c for c in df.columns if re.search(col_regex, c, re.I)]
            if cols:
                vc = (
                    df[cols[0]]
                    .astype(str)
                    .str.strip()
                    .replace({"": None})
                    .value_counts(dropna=False)
                    .head(12)
                    .to_string()
                )
                return f"In sheet '{name}', top {what}:\n{vc}"
        return None

    if "status" in q:
        ans = try_counts(r"(status|state|rag|progress|stage)", "statuses")
        if ans:
            return ans
    if "owner" in q or "assignee" in q or "lead" in q:
        ans = try_counts(r"(owner|assignee|assigned|manager|lead)", "owners")
        if ans:
            return ans
    if "campaign" in q or "project" in q:
        for name, df in dfs.items():
            cols = [c for c in df.columns if re.search(r"(campaign|project|initiative|program|activity)", c, re.I)]
            if cols:
                uniq = (
                    df[cols[0]]
                    .dropna()
                    .astype(str)
                    .str.strip()
                    .replace({"": None})
                    .dropna()
                    .unique()[:25]
                )
                return f"In sheet '{name}', found campaigns/projects:\n- " + "\n- ".join(map(str, uniq))
    if "deadline" in q or "due" in q or "end" in q:
        for name, df in dfs.items():
            cols = [c for c in df.columns if re.search(r"(deadline|due|end|target|finish)", c, re.I)]
            if cols:
                s = pd.to_datetime(df[cols[0]], errors="coerce")
                soon = s[s >= pd.Timestamp.now()].sort_values().head(12).dropna()
                if not soon.empty:
                    return f"Upcoming deadlines from '{name}':\n" + "\n".join(d.strftime("%Y-%m-%d") for d in soon)
    return "I need clearer cues (status/owner/campaign/deadline columns). Try: 'Show RAG by campaign for October'."
