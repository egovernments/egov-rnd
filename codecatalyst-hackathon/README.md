# HCM Campaign Planning & Analytics Dashboard

A comprehensive dashboard for managing and analyzing HCM (Health Campaign Management) campaigns across multiple countries. Features interactive visualizations, AI-powered Q&A, and detailed campaign tracking.

## 🚀 Quick Start

### Prerequisites

- Python 3.8+
- pip
- (Optional) Google Cloud service account for Google Sheets integration

### Installation

```bash
# 1. Clone the repository
git clone <your-repo-url>
cd codecatalyst-hackathon

# 2. Create virtual environment
cd backend
python3 -m venv .venv
source .venv/bin/activate  # On Windows: .venv\Scripts\activate

# 3. Install dependencies
pip install -r requirements.txt

# 4. (Optional) Configure environment variables
cp .env.example .env
# Edit .env and add your OpenAI API key if needed
```

### Running the Application

**Option 1: Modern FastAPI UI (Recommended)**
```bash
cd ui
../backend/.venv/bin/python app.py
```
Then open: http://localhost:8000

**Option 2: Classic Streamlit UI**
```bash
cd backend
.venv/bin/streamlit run app.py
```

## 📁 Project Structure

```
codecatalyst-hackathon/
├── assets/                    # CSV data files
│   └── HCM_Campaign Calendar - Sheet1.csv
│
├── backend/                   # Python backend logic
│   ├── .venv/                # Virtual environment
│   ├── app.py               # Streamlit application
│   ├── campaign_analytics.py # Campaign-specific analytics
│   ├── qa_engine.py         # AI question answering
│   ├── gsheet_utils.py      # Google Sheets integration
│   ├── dashboard.py         # Dashboard utilities
│   ├── prompts.py          # AI prompts
│   ├── profiling.py        # Data profiling
│   ├── data_loader.py      # Data loading utilities
│   ├── requirements.txt    # Python dependencies
│   └── README.md
│
└── ui/                       # FastAPI web interface
    ├── app.py               # FastAPI application
    ├── templates/
    │   ├── campaign_dashboard.html  # Main dashboard
    │   └── index.html              # General dashboard
    └── README.md
```

## ✨ Features

### 📊 Campaign Dashboard
- **KPI Cards**: Total campaigns, countries, ongoing campaigns, upcoming campaigns
- **Interactive Charts**:
  - Campaign status breakdown (pie chart)
  - Country distribution (bar chart)
  - Campaign types (bar chart)
  - Infrastructure breakdown (pie chart)
  - Complexity levels (pie chart)
  - Partner distribution (bar chart)

### 🗓️ Campaign Timeline
- Visual timeline showing monthly campaign activities
- Color-coded badges for UAT, ToT, and Go-Live phases
- Click to view detailed campaign information

### 🔍 Campaign Details
- Click any campaign to see full details
- Organized view of all campaign attributes
- Priority information displayed first

### 🤖 AI-Powered Chatbot
- Ask questions in natural language
- Supports queries like:
  - "Which campaigns are ongoing?"
  - "Show me campaigns in Nigeria"
  - "What campaigns have high complexity?"
  - "List all partners involved"

### 📂 Multiple Data Sources
1. **Load from Assets Folder**: Pre-loaded CSV files
2. **CSV Upload**: Upload any CSV file
3. **Google Sheets**: Direct integration with live sheets

### 📱 Mobile Responsive
- Works seamlessly on desktop, tablet, and mobile
- Adaptive layouts and touch-friendly interface

## 🔧 Configuration

### Google Sheets Integration

To load data from Google Sheets:

1. Create a Google Cloud project
2. Enable "Google Sheets API" and "Drive API"
3. Create a service account and download JSON key
4. Save the JSON file as `backend/secrets/service_account.json`
5. Share your Google Sheet with the service account email

### OpenAI Integration (Optional)

For enhanced AI responses:

1. Get an OpenAI API key from https://platform.openai.com
2. Add to `backend/.env`:
   ```
   OPENAI_API_KEY=your-api-key-here
   ```

Without OpenAI, the chatbot uses intelligent heuristics.

## 📖 Usage Guide

### Loading Data

1. **From Assets Folder** (Easiest):
   - Place CSV files in `assets/` folder
   - Click "Load from Assets"
   - Select your file

2. **Upload CSV**:
   - Click "Upload CSV"
   - Choose a file from your computer

3. **Google Sheets**:
   - Click "Google Sheet"
   - Paste the sheet URL
   - (Optional) Upload service account JSON
   - Click "Load Google Sheet"

### Using the Dashboard

- **View Charts**: Scroll through the dashboard to see different analytics
- **Search Campaigns**: Use the search box to filter campaigns
- **Click for Details**: Click any campaign in the timeline or list to view full details
- **Ask Questions**: Click the 💬 button to chat with the AI assistant

### Sample Questions for Chatbot

```
- Which campaigns are ongoing?
- Show me campaigns in Nigeria
- Which campaigns have high complexity?
- What are the campaign types?
- Show me campaigns by partner
- How many campaigns are there?
- What campaigns are using Azure infrastructure?
```

## 🛠️ Development

### Tech Stack

- **Backend**: Python, FastAPI, Pandas, NumPy
- **Frontend**: HTML5, CSS3, JavaScript (ES6+)
- **Charts**: Chart.js
- **AI**: OpenAI GPT-4o-mini (optional)

### API Endpoints

See `ui/README.md` for complete API documentation.

### Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## 📝 License

MIT License - see LICENSE file for details

## 🤝 Support

For issues, questions, or contributions, please open an issue on GitHub.

---

**Built for eGov Foundation** | Campaign Planning & Analytics
