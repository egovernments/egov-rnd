from __future__ import annotations
from typing import Dict, Any, Optional
import pandas as pd
import re
import requests
import io
from google.oauth2 import service_account
import gspread

SCOPE = ["https://www.googleapis.com/auth/spreadsheets.readonly",
         "https://www.googleapis.com/auth/drive.readonly"]

def _public_export_to_csv(sheet_url: str) -> Optional[pd.DataFrame]:
    """
    Best-effort attempt for publicly readable sheets (single sheet only).
    Falls back to None if format isn't compatible.
    """
    try:
        # Try the "export?format=csv" pattern:
        # https://docs.google.com/spreadsheets/d/<ID>/export?format=csv
        m = re.search(r"/spreadsheets/d/([a-zA-Z0-9-_]+)", sheet_url)
        if not m:
            return None
        sheet_id = m.group(1)
        export_url = f"https://docs.google.com/spreadsheets/d/{sheet_id}/export?format=csv"
        resp = requests.get(export_url, timeout=20)
        if resp.status_code == 200 and resp.content:
            return pd.read_csv(io.BytesIO(resp.content))
    except Exception:
        return None
    return None

def load_google_sheet_all_tabs(sheet_url: str, sa_json_bytes: Optional[bytes]) -> Dict[str, pd.DataFrame]:
    """
    Load all worksheets from a Google Sheet URL.
    If `sa_json_bytes` is provided, uses a Service Account.
    Else tries a public CSV export for single-sheet; if multiple sheets, requires SA.
    """
    if sa_json_bytes:
        creds = service_account.Credentials.from_service_account_info(
            info=__import__("json").loads(sa_json_bytes.decode("utf-8")),
            scopes=SCOPE
        )
        client = gspread.authorize(creds)
        sh = client.open_by_url(sheet_url)
        out = {}
        for ws in sh.worksheets():
            # Get all values to handle duplicate/empty headers
            all_values = ws.get_all_values()
            if not all_values:
                out[ws.title] = pd.DataFrame()
                continue

            # First row as headers
            headers = all_values[0]
            data_rows = all_values[1:]

            # Handle duplicate or empty column names
            seen = {}
            clean_headers = []
            for i, h in enumerate(headers):
                if not h or h.strip() == '':
                    h = f'Column_{i+1}'
                # Remove newlines and extra whitespace
                h = str(h).replace('\n', ' ').strip()
                if h in seen:
                    seen[h] += 1
                    clean_headers.append(f'{h}_{seen[h]}')
                else:
                    seen[h] = 0
                    clean_headers.append(h)

            df = pd.DataFrame(data_rows, columns=clean_headers)

            # Clean string data - strip whitespace from all cells
            for col in df.columns:
                if df[col].dtype == 'object':
                    df[col] = df[col].apply(lambda x: str(x).strip() if x and str(x).strip() != '' else x)

            out[ws.title] = df
        return out
    else:
        # Public single-sheet fallback:
        df = _public_export_to_csv(sheet_url)
        if df is not None:
            return {"Sheet1": df}
        raise RuntimeError("This Google Sheet likely requires credentials or is multi-tabbed. Upload a Service Account JSON or change sharing.")
