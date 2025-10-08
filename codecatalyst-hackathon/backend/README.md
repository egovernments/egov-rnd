# AI Sheets Planner — Campaign & Planning Assistant

An end‑to‑end Streamlit app that lets you:
- Paste a **Google Sheet link** (with multiple tabs) _or_ **upload an Excel file (.xlsx)**.
- Auto‑extract all sheets and profile the data.
- Ask **natural‑language questions** (“Which campaigns are delayed?”) and get answers.
- Generate quick **insights & summaries** (upcoming deadlines, status counts, owners).
- Export cleaned/merged CSV and suggested pivot tables.

> AI features use OpenAI. They are **optional**—the app works without them (explore & filter UI).

---

## 1) Quick Start

```bash
# 1) Create & activate a virtual environment (recommended)
python -m venv .venv
# Windows
.venv\Scripts\activate
# macOS / Linux
source .venv/bin/activate

# 2) Install deps
pip install -r requirements.txt

# 3) (Optional) Set your OpenAI API key for AI Q&A
# On macOS/Linux:
export OPENAI_API_KEY="sk-..."
# On Windows PowerShell:
setx OPENAI_API_KEY "sk-..."

# 4) (Option A) Google Sheets via Service Account
#   - Create a Google Cloud project, enable "Google Sheets API" and "Drive API"
#   - Create a service account; generate a JSON key file.
#   - Share your Google Sheet with the service account's email (Viewer or Editor).
#   - Save the JSON as: secrets/service_account.json  (or upload it in the UI).

# 5) Run
streamlit run app.py
```

If you only use **Excel uploads**, you don’t need Google APIs.

---

## 2) Features

- **Multiple-sheet ingestion**: Automatically loads every tab from a Google Sheet or Excel workbook.
- **Schema profiling**: Detects datatypes (dates, numbers, text), nulls, unique counts.
- **Smart date handling**: Infers deadline-like columns (e.g., `due`, `deadline`, `end_date`).
- **Planning helpers**: Quick filters (owner, status), upcoming milestones, RAG breakdowns if present.
- **AI Q&A (optional)**: Natural language questions over your data using OpenAI.
- **Exports**: Download cleaned CSVs and a merged “long” CSV (if shapes align).
- **Privacy**: Your data stays local to your machine/session.

---

## 3) Project Structure

```
ai-sheets-planner/
├─ app.py                    # Streamlit UI
├─ data_loader.py            # Excel/Google Sheets loaders
├─ profiling.py              # Column/type inference & quick insights
├─ qa_engine.py              # Optional LLM-powered Q&A over DataFrames
├─ prompts.py                # System & task prompts for AI
├─ gsheet_utils.py           # Google auth helpers
├─ requirements.txt
├─ .env.example              # Example env vars
└─ secrets/
   └─ service_account.json   # (optional) your Google SA key here
```

---

## 4) Environment Variables

Copy `.env.example` to `.env` and update if needed:

```
OPENAI_API_KEY=
GOOGLE_SA_PATH=secrets/service_account.json
```

You can also **upload** the service account JSON via the UI instead of setting `GOOGLE_SA_PATH`.

---

## 5) Notes on Google Sheets Access

Two common ways to access Google Sheets programmatically:

1. **Service Account (recommended for teams/servers)**
   - Enable APIs; create service account; download JSON key.
   - Share your Sheet with the service account email.
   - Place JSON at `secrets/service_account.json` (default) or upload it in the UI.

2. **Public/Anyone-with-link Viewer**
   - If your sheet is OK to be read by link viewers, set sharing accordingly.
   - In that case, the app can fetch without credentials (best-effort via pandas).

---

## 6) Security

- Keep your `service_account.json` secret.
- Do not commit secrets to version control.
- The app never sends your data externally unless you enable the AI features; even then, only the prompt + **a sampled subset (few rows/columns)** is sent to the LLM to preserve privacy. You can change sampling limits in `qa_engine.py`.

---

## 7) Roadmap

- Fine-grained row-level Q&A with SQL-lite backing store.
- Chart templates (Gantt, burndown) generated on the fly.
- Role-based sharing via Streamlit Community Cloud or self-hosted.
