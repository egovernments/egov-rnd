@echo off
REM HCM Campaign Dashboard Startup Script (Windows)

cd /d "%~dp0"

echo.
echo Starting HCM Campaign Dashboard...
echo.

REM Check if virtual environment exists
if not exist "..\backend\.venv" (
    echo Virtual environment not found!
    echo Please run from backend folder:
    echo   cd backend
    echo   python -m venv .venv
    echo   .venv\Scripts\activate
    echo   pip install -r requirements.txt
    pause
    exit /b 1
)

echo Dashboard will be available at: http://localhost:8000
echo.

REM Run the FastAPI application
..\backend\.venv\Scripts\python.exe app.py
