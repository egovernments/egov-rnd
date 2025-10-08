from __future__ import annotations
from typing import Dict, Any, Optional, Tuple
import pandas as pd
from io import BytesIO

from gsheet_utils import load_google_sheet_all_tabs

def load_excel_all_sheets(file_bytes: bytes) -> Dict[str, pd.DataFrame]:
    return pd.read_excel(BytesIO(file_bytes), sheet_name=None, engine="openpyxl")

def load_from_source(
    source_kind: str,
    file_bytes: Optional[bytes] = None,
    gsheet_url: Optional[str] = None,
    sa_json_bytes: Optional[bytes] = None,
) -> Dict[str, pd.DataFrame]:
    if source_kind == "excel":
        if not file_bytes:
            raise ValueError("Excel bytes missing")
        return load_excel_all_sheets(file_bytes)
    elif source_kind == "gsheet":
        if not gsheet_url:
            raise ValueError("Google Sheet URL missing")
        return load_google_sheet_all_tabs(gsheet_url, sa_json_bytes)
    else:
        raise ValueError(f"Unknown source_kind: {source_kind}")
