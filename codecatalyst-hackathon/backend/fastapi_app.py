# fastapi_app.py
import os
from typing import Optional

import pandas as pd
from fastapi import FastAPI, Request, UploadFile, File, Form
from fastapi.middleware.cors import CORSMiddleware
from fastapi.responses import HTMLResponse, JSONResponse
from fastapi.templating import Jinja2Templates
from fastapi.staticfiles import StaticFiles

from dotenv import load_dotenv

from gsheet_utils import load_google_sheet_all_tabs
from dashboard import kpis, status_breakdown, owner_workload, upcoming_deadlines, gantt_dataframe
from campaign_analytics import (
    get_campaign_status_breakdown,
    get_country_breakdown,
    get_campaign_type_breakdown,
    get_partner_breakdown,
    get_quarter_breakdown,
    get_complexity_breakdown,
    get_infrastructure_breakdown,
    get_timeline_data,
    get_campaign_summary,
    get_campaign_details,
    get_all_campaigns_list,
)
from qa_engine import answer_question
from scheduler_ai import detect_conflicts

load_dotenv()

app = FastAPI(title="AI Sheets Dashboard")

# CORS for local dev / demo UIs
app.add_middleware(
    CORSMiddleware,
    allow_origins=os.getenv("CORS_ALLOW_ORIGINS", "*").split(","),
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Setup templates
templates = Jinja2Templates(directory="templates")

# Mount static files (assets folder)
assets_path = os.path.join(os.path.dirname(__file__), "..", "assets")
if os.path.exists(assets_path):
    app.mount("/assets", StaticFiles(directory=assets_path), name="assets")

# In-memory storage for loaded data
data_store = {}


@app.get("/", response_class=HTMLResponse)
async def home(request: Request):
    return templates.TemplateResponse("campaign_dashboard.html", {"request": request})


@app.get("/general", response_class=HTMLResponse)
async def general_dashboard(request: Request):
    return templates.TemplateResponse("index.html", {"request": request})


@app.post("/load-sheet")
async def load_sheet(sheet_url: str = Form(...), sa_file: Optional[UploadFile] = File(None)):
    try:
        sa_bytes = None
        if sa_file:
            sa_bytes = await sa_file.read()
        elif os.getenv("GOOGLE_SA_PATH") and os.path.exists(os.getenv("GOOGLE_SA_PATH")):
            with open(os.getenv("GOOGLE_SA_PATH"), "rb") as f:
                sa_bytes = f.read()

        dfs = load_google_sheet_all_tabs(sheet_url, sa_bytes)

        # normalize all loaded sheets
        for k, df in dfs.items():
            df.columns = [str(col).replace("\n", " ").strip() for col in df.columns]
            for col in df.columns:
                if df[col].dtype == "object":
                    df[col] = df[col].apply(lambda x: str(x).strip() if pd.notna(x) and x != "" else x)

        data_store["dfs"] = dfs
        return JSONResponse({"status": "success", "message": f"Loaded {len(dfs)} sheet(s)", "sheets": list(dfs.keys())})
    except Exception as e:
        return JSONResponse({"status": "error", "message": str(e)}, status_code=400)


@app.post("/upload-csv")
async def upload_csv(csv_file: UploadFile = File(...)):
    try:
        import io

        contents = await csv_file.read()
        df = pd.read_csv(io.BytesIO(contents))
        df.columns = [str(col).replace("\n", " ").strip() for col in df.columns]
        for col in df.columns:
            if df[col].dtype == "object":
                df[col] = df[col].apply(lambda x: str(x).strip() if pd.notna(x) and x != "" else x)
        data_store["dfs"] = {csv_file.filename: df}
        return JSONResponse(
            {"status": "success", "message": f"Loaded CSV with {len(df)} rows and {len(df.columns)} columns", "sheets": [csv_file.filename]}
        )
    except Exception as e:
        return JSONResponse({"status": "error", "message": str(e)}, status_code=400)


@app.get("/api/assets/files")
async def list_assets():
    import glob

    assets_path = os.path.join(os.path.dirname(__file__), "..", "assets")
    csv_files = glob.glob(os.path.join(assets_path, "*.csv"))
    file_names = [os.path.basename(f) for f in csv_files]
    return JSONResponse({"files": file_names})


@app.post("/api/assets/load/{filename}")
async def load_from_assets(filename: str):
    try:
        assets_path = os.path.join(os.path.dirname(__file__), "..", "assets")
        file_path = os.path.join(assets_path, filename)

        # Security: prevent directory traversal
        if not os.path.abspath(file_path).startswith(os.path.abspath(assets_path)):
            return JSONResponse({"status": "error", "message": "Invalid file path"}, status_code=400)

        if not os.path.exists(file_path):
            return JSONResponse({"status": "error", "message": "File not found"}, status_code=404)

        df = pd.read_csv(file_path)
        df.columns = [str(col).replace("\n", " ").strip() for col in df.columns]
        for col in df.columns:
            if df[col].dtype == "object":
                df[col] = df[col].apply(lambda x: str(x).strip() if pd.notna(x) and x != "" else x)
        data_store["dfs"] = {filename: df}
        return JSONResponse({"status": "success", "message": f"Loaded {filename} with {len(df)} rows and {len(df.columns)} columns", "sheets": [filename]})
    except Exception as e:
        return JSONResponse({"status": "error", "message": str(e)}, status_code=400)


@app.get("/api/kpis")
async def get_kpis():
    dfs = data_store.get("dfs", {})
    if not dfs:
        return JSONResponse({"error": "No data loaded"}, status_code=400)
    return JSONResponse(kpis(dfs))


@app.get("/api/status-breakdown")
async def get_status_breakdown_route():
    dfs = data_store.get("dfs", {})
    if not dfs:
        return JSONResponse({"error": "No data loaded"}, status_code=400)
    sb = status_breakdown(dfs)
    if sb.empty:
        return JSONResponse({"labels": [], "values": []})
    return JSONResponse({"labels": sb.index.tolist(), "values": sb.values.tolist()})


@app.get("/api/owner-workload")
async def get_owner_workload_route():
    dfs = data_store.get("dfs", {})
    if not dfs:
        return JSONResponse({"error": "No data loaded"}, status_code=400)
    ow = owner_workload(dfs)
    if ow.empty:
        return JSONResponse({"labels": [], "values": []})
    ow = ow.head(15)
    return JSONResponse({"labels": ow.index.tolist(), "values": ow.values.tolist()})


@app.get("/api/upcoming-deadlines")
async def get_upcoming_deadlines_route():
    dfs = data_store.get("dfs", {})
    if not dfs:
        return JSONResponse({"error": "No data loaded"}, status_code=400)
    ud = upcoming_deadlines(dfs, 45)
    if ud.empty:
        return JSONResponse({"data": []})
    return JSONResponse({"data": ud.head(50).to_dict("records")})


@app.get("/api/sheets")
async def get_sheets():
    dfs = data_store.get("dfs", {})
    return JSONResponse({"sheets": list(dfs.keys()), "count": len(dfs)})


@app.get("/api/sheet/{sheet_name}")
async def get_sheet_data(sheet_name: str):
    dfs = data_store.get("dfs", {})
    if not dfs:
        return JSONResponse({"error": "No data loaded"}, status_code=400)
    if sheet_name not in dfs:
        return JSONResponse({"error": "Sheet not found"}, status_code=404)
    df = dfs[sheet_name]
    return JSONResponse({"columns": df.columns.tolist(), "data": df.head(100).to_dict("records"), "total_rows": len(df)})


@app.get("/api/campaign-analytics")
async def get_campaign_analytics():
    dfs = data_store.get("dfs", {})
    if not dfs:
        return JSONResponse({"error": "No data loaded"}, status_code=400)
    df = list(dfs.values())[0]
    return JSONResponse(
        {
            "summary": get_campaign_summary(df),
            "status_breakdown": get_campaign_status_breakdown(df),
            "country_breakdown": get_country_breakdown(df),
            "campaign_type_breakdown": get_campaign_type_breakdown(df),
            "partner_breakdown": get_partner_breakdown(df),
            "quarter_breakdown": get_quarter_breakdown(df),
            "complexity_breakdown": get_complexity_breakdown(df),
            "infrastructure_breakdown": get_infrastructure_breakdown(df),
            "timeline": get_timeline_data(df),
        }
    )


@app.get("/api/campaigns/list")
async def get_campaigns_list():
    dfs = data_store.get("dfs", {})
    if not dfs:
        return JSONResponse({"error": "No data loaded"}, status_code=400)
    df = list(dfs.values())[0]
    return JSONResponse({"campaigns": get_all_campaigns_list(df)})


@app.get("/api/campaigns/{campaign_name:path}")
async def get_campaign_detail(campaign_name: str):
    dfs = data_store.get("dfs", {})
    if not dfs:
        return JSONResponse({"error": "No data loaded"}, status_code=400)
    df = list(dfs.values())[0]
    details = get_campaign_details(df, campaign_name)
    if not details:
        return JSONResponse({"error": "Campaign not found", "searched": campaign_name}, status_code=404)
    return JSONResponse({"campaign": details})


@app.post("/api/chat")
async def chat(request: Request):
    """
    Chat with AI about the loaded data.
    Optional: pass {"intent": "schedule"} to run conflict detection.
    """
    try:
        body = await request.json()
        question = body.get("question", "")
        intent = body.get("intent", "query")

        if not question and intent == "query":
            return JSONResponse({"error": "No question provided"}, status_code=400)

        dfs = data_store.get("dfs", {})
        if not dfs:
            return JSONResponse({"answer": "Please load a dataset first."})

        if intent == "schedule":
            return JSONResponse(detect_conflicts(dfs))

        answer = answer_question(question, dfs)
        return JSONResponse({"answer": answer, "question": question})
    except Exception as e:
        return JSONResponse({"error": str(e)}, status_code=500)


@app.get("/api/insights")
async def insights():
    dfs = data_store.get("dfs", {})
    if not dfs:
        return JSONResponse({"error": "No data loaded"}, status_code=400)
    df = list(dfs.values())[0]
    summary = get_campaign_summary(df)
    countries = get_country_breakdown(df)
    partners = get_partner_breakdown(df)
    types = get_campaign_type_breakdown(df)
    return JSONResponse(
        {
            "summary": summary,
            "top_countries": sorted(countries.items(), key=lambda x: x[1], reverse=True)[:5],
            "top_partners": sorted(partners.items(), key=lambda x: x[1], reverse=True)[:5],
            "types": types,
        }
    )


@app.get("/api/conflicts")
async def conflicts_route():
    dfs = data_store.get("dfs", {})
    if not dfs:
        return JSONResponse({"error": "No data loaded"}, status_code=400)
    return JSONResponse(detect_conflicts(dfs))


@app.get("/api/debug/columns")
async def debug_columns():
    dfs = data_store.get("dfs", {})
    if not dfs:
        return JSONResponse({"error": "No data loaded"}, status_code=400)
    result = {}
    for sheet_name, df in dfs.items():
        sample_df = df.head(2).fillna("")
        result[sheet_name] = {
            "columns": df.columns.tolist(),
            "shape": list(df.shape),
            "sample_data": sample_df.to_dict("records"),
        }
    return JSONResponse(result)


if __name__ == "__main__":
    import uvicorn

    uvicorn.run(app, host="0.0.0.0", port=int(os.getenv("PORT", "8000")))
