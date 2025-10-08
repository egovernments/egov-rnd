#!/bin/bash

# HCM Campaign Dashboard Startup Script

cd "$(dirname "$0")"

echo "🚀 Starting HCM Campaign Dashboard..."
echo ""

# Check if virtual environment exists
if [ ! -d "../backend/.venv" ]; then
    echo "❌ Virtual environment not found!"
    echo "Please run from backend folder:"
    echo "  cd backend"
    echo "  python3 -m venv .venv"
    echo "  source .venv/bin/activate"
    echo "  pip install -r requirements.txt"
    exit 1
fi

# Run the FastAPI application
echo "📊 Dashboard will be available at: http://localhost:8000"
echo ""

../backend/.venv/bin/python app.py
