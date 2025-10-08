# HCM Campaign Dashboard UI

Modern web-based dashboard for visualizing and analyzing HCM campaign data.

## Features

- 📊 **Interactive Charts**: Status, country, type, complexity, infrastructure, and partner breakdowns
- 🗓️ **Campaign Timeline**: Visual timeline with monthly activities (UAT, ToT, Go-Live)
- 🔍 **Campaign Details**: Click any campaign to view detailed information
- 🔎 **Search & Filter**: Real-time search across all campaigns
- 🤖 **AI Chatbot**: Ask questions about your campaign data
- 📂 **Multiple Data Sources**: Load from Google Sheets, CSV upload, or assets folder
- 📱 **Mobile Responsive**: Works on all devices

## Quick Start

### 1. Install Dependencies

From the project root:

```bash
cd backend
python3 -m venv .venv
source .venv/bin/activate  # On Windows: .venv\Scripts\activate
pip install -r requirements.txt
```

### 2. Run the Dashboard

**Option 1: Use the startup script (Easiest)**

Linux/Mac:
```bash
cd ui
./run.sh
```

Windows:
```bash
cd ui
run.bat
```

**Option 2: Run directly with Python**
```bash
cd ui
../backend/.venv/bin/python app.py
```

**Option 3: Use uvicorn directly**
```bash
cd ui
../backend/.venv/bin/uvicorn app:app --reload --host 0.0.0.0 --port 8000
```

### 3. Open in Browser

Visit: http://localhost:8000

## Data Loading Options

### Option 1: Load from Assets Folder
1. Place your CSV files in the `assets/` folder
2. Click "Load from Assets" button
3. Select your CSV file

### Option 2: Upload CSV
1. Click "Upload CSV" button
2. Select a CSV file from your computer
3. Click "Upload CSV"

### Option 3: Google Sheets
1. Click "Google Sheet" button
2. Paste your Google Sheets URL
3. (Optional) Upload service account JSON for private sheets
4. Click "Load Google Sheet"

## Using the Chatbot

Click the 💬 button in the bottom-right corner and ask questions like:

- "Which campaigns are ongoing?"
- "Show me campaigns in Nigeria"
- "Which campaigns have high complexity?"
- "What are the campaign types?"
- "Show me campaigns by partner"
- "How many campaigns are there?"

### Optional: OpenAI Integration

For smarter AI responses, add your OpenAI API key to `backend/.env`:

```
OPENAI_API_KEY=your-api-key-here
```

Without it, the chatbot uses intelligent heuristics based on your data.

## API Endpoints

- `GET /` - Main dashboard page
- `GET /general` - General purpose dashboard
- `POST /upload-csv` - Upload CSV file
- `POST /load-sheet` - Load Google Sheet
- `GET /api/assets/files` - List CSV files in assets folder
- `POST /api/assets/load/{filename}` - Load CSV from assets
- `GET /api/campaign-analytics` - Get campaign analytics
- `GET /api/campaigns/list` - Get all campaigns
- `GET /api/campaigns/{name}` - Get campaign details
- `POST /api/chat` - Chat with AI assistant

## Project Structure

```
ui/
├── app.py              # FastAPI application
├── templates/
│   ├── campaign_dashboard.html  # Main campaign dashboard
│   └── index.html              # General dashboard
└── README.md

backend/
├── campaign_analytics.py  # Campaign-specific analytics
├── qa_engine.py          # AI question answering
├── gsheet_utils.py       # Google Sheets integration
├── dashboard.py          # Dashboard utilities
└── prompts.py           # AI prompts

assets/
└── *.csv               # CSV data files
```

## Technologies Used

- **Backend**: FastAPI, Python, Pandas
- **Frontend**: HTML, CSS, JavaScript
- **Charts**: Chart.js
- **AI**: OpenAI GPT-4o-mini (optional)

## License

MIT
