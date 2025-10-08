# AI Sheets Planner — Campaign & Planning Assistant

A modern web application for campaign management and planning that provides:
- **Multiple data sources**: Load data from **Google Sheets**, **upload CSV files**, or select from **asset folder**.
- **Interactive Dashboard**: View campaigns with rich analytics and visualizations.
- **Country-based Grouping**: Campaigns organized by country with collapsible sections for easy navigation.
- **Timeline Integration**: Campaign timelines (ToT, UAT, Go-Live) displayed inline with each campaign.
- **AI-Powered Chatbot**: Ask natural-language questions about your campaigns and get instant answers.
- **Detailed Analytics**: KPIs, charts for status, country distribution, campaign types, infrastructure, complexity, and partners.
- **Campaign Details**: Click any campaign to view complete information in a modal dialog.

> AI features use OpenAI. They are **optional**—the app works without them.

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

# 5) Run the application
python3 fastapi_app.py

# The dashboard will be available at:
# - Main Dashboard: http://localhost:8000/
# - Campaign Dashboard: http://localhost:8000/campaign-dashboard
```

If you only use **Excel uploads**, you don’t need Google APIs.

---

## 2) Features

### Dashboard Features
- **Multi-source Data Loading**:
  - Google Sheets with service account authentication
  - CSV file upload
  - Direct load from assets folder

- **Campaign Analytics**:
  - **KPI Cards**: Total campaigns, countries, ongoing campaigns, and campaigns yet to start
  - **Interactive Charts**:
    - Campaign status breakdown (bar chart)
    - Country distribution (bar chart)
    - Campaign type analysis (bar chart)
    - Infrastructure breakdown (donut chart)
    - Complexity level distribution (donut chart)
    - Campaign partners analysis (bar chart)

- **Country-Grouped Campaign View**:
  - Campaigns organized by country with collapsible sections
  - Each campaign shows:
    - Campaign name and status
    - Campaign type
    - Timeline badges (ToT, UAT, Go-Live) with color coding
  - Click to expand/collapse country groups
  - Search functionality across campaigns, countries, and types

- **AI Chatbot Assistant**:
  - Floating chatbot accessible from any page
  - Natural language queries about campaigns
  - Context-aware responses about campaign data

- **Campaign Details Modal**:
  - Click any campaign to view complete information
  - Organized display of all campaign fields
  - Easy navigation and search

### UI Design
- **Modern Color Scheme**:
  - Background: #EEEEEE (Light gray)
  - Primary: #C84C0E (Orange)
  - Text: #0A4A66 (Dark blue)
  - Accent colors for different activities

- **Responsive Design**: Works seamlessly on desktop and mobile devices
- **Interactive Elements**: Hover effects, collapsible sections, and smooth animations

---

## 3) Project Structure

```
codecatalyst-hackathon/
├─ backend/
│  ├─ fastapi_app.py              # FastAPI application server
│  ├─ app.py                      # Legacy Streamlit UI
│  ├─ dashboard.py                # Dashboard data endpoints
│  ├─ campaign_analytics.py       # Campaign analytics engine
│  ├─ data_loader.py              # Excel/Google Sheets/CSV loaders
│  ├─ profiling.py                # Data profiling and insights
│  ├─ qa_engine.py                # LLM-powered Q&A over DataFrames
│  ├─ prompts.py                  # System & task prompts for AI chatbot
│  ├─ gsheet_utils.py             # Google Sheets authentication
│  ├─ scheduler_ai.py             # AI scheduling features
│  ├─ templates/
│  │  ├─ index.html               # Main dashboard UI
│  │  └─ campaign_dashboard.html  # Campaign dashboard with country grouping
│  ├─ requirements.txt
│  └─ .env.example
├─ assets/                        # CSV files for quick loading
└─ secrets/
   └─ service_account.json        # (optional) Google service account key
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

## 7) API Endpoints

The FastAPI application provides the following endpoints:

### Data Loading
- `POST /load-sheet` - Load data from Google Sheets
- `POST /upload-csv` - Upload CSV file
- `POST /api/assets/load/{filename}` - Load file from assets folder
- `GET /api/assets/files` - List available files in assets folder

### Analytics
- `GET /api/campaign-analytics` - Get comprehensive campaign analytics
- `GET /api/campaigns/list` - Get list of all campaigns
- `GET /api/campaigns/{campaign_name}` - Get details of specific campaign
- `GET /api/kpis` - Get dashboard KPIs
- `GET /api/status-breakdown` - Get status breakdown data
- `GET /api/owner-workload` - Get owner workload data
- `GET /api/upcoming-deadlines` - Get upcoming deadlines

### AI Features
- `POST /api/chat` - Chat with AI assistant about campaigns

### Pages
- `GET /` - Main dashboard
- `GET /campaign-dashboard` - Campaign dashboard with country grouping

---

## 8) Usage Guide

### Loading Data
1. Navigate to the dashboard
2. Choose data source:
   - **Google Sheet**: Paste the sheet URL and optionally upload service account JSON
   - **Upload CSV**: Select a CSV file from your computer
   - **Load from Assets**: Click on any pre-loaded file from the assets folder

### Viewing Campaigns
- Once data is loaded, the dashboard displays:
  - KPI summary cards at the top
  - Interactive charts in a grid layout
  - Country-grouped campaign list at the bottom

### Exploring Campaigns by Country
- Each country has a collapsible header showing the campaign count
- Click the country header to expand/collapse campaigns
- Each campaign card shows:
  - Campaign name
  - Status badge (ongoing/yet to start)
  - Campaign type
  - Timeline with color-coded badges (ToT, UAT, Go-Live)
- Click any campaign card to view full details in a modal

### Using the AI Chatbot
1. Click the floating chat button (💬) in the bottom-right corner
2. Type your question about campaigns
3. Examples:
   - "Which campaigns are ongoing?"
   - "Show me campaigns by country"
   - "What are the upcoming deadlines?"
   - "Which campaigns have high complexity?"

### Search and Filter
- Use the search box to filter campaigns by:
  - Campaign name
  - Country name
  - Campaign type

---

## 9) Roadmap

- Export campaign reports as PDF
- Gantt chart view for campaign timelines
- Advanced filtering and sorting options
- Campaign comparison tool
- Email notifications for upcoming deadlines
- Role-based access control
- Integration with project management tools
