# Database Viewer Frontend

Clean frontend UI to display data from PostgreSQL and Elasticsearch databases.

## Setup

```bash
cd ai_chatbot/frontend

# Install dependencies
npm install

# Start the frontend
npm start
```

Frontend opens at `http://localhost:3000`

## API Configuration

The frontend connects to: `http://192.168.200.31:8000/unified/query`

To change the API URL, edit `src/utils/apiConfig.js`:
```javascript
export const API_BASE_URL = 'http://your-api-url:port';
```

## Usage

1. Select database (PostgreSQL or Elasticsearch)
2. Enter your query in natural language
3. View results in a clean pgAdmin-like table

## Example Queries

**PostgreSQL:**
- "Give me 10 user details of registered persons with address"
- "Show me 20 birth registration applications"

**Elasticsearch:**
- "Give me 10 property records"
- "Show me property assessment data"

## Features

✅ PostgreSQL & Elasticsearch 6.x support
✅ Clean table display with pagination (20 rows/page)
✅ Flattens nested Elasticsearch data for easy viewing
✅ Shows generated SQL/ES queries
✅ Responsive design

## Tech Stack

- React 18
- Axios
- CSS3
