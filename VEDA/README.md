# VEDA (Virtual eGov Data Assistant)

## Overview

VEDA is a Virtual eGov Data Assistant designed to help users interact with eGov datasets, answer queries, and provide insights using AI-powered tools. It leverages a local vector database and a open-ai to process and respond to user questions about property tax, boundaries, payments, and more.

---

## Folder Structure

- **chroma.sqlite3**  
  Local vector database file used for storing embeddings and search data.

- **docker-compose.yaml**  
  Docker Compose file for setting up local postgresql database.

- **veda.py**  
  Main Python script for running the VEDA service.

- **training/**  
  - **data/**  
    - `documentation.json`: Documentation and descriptions about the database tables for training.
    - `questions/`: Contains training question, sql for the datasets (e.g., `property_tax.json`, `property.json`).
  - **ddl/**  
    - SQL files for database schema for training (`boundary.sql`, `owner.sql`, `payment.sql`, `property-tax-demand.sql`, `property.sql`).

---

## Setup Instructions

### 1. Prerequisites

- Docker and Docker Compose installed
- Python 3.12 (if running outside Docker)

### 2. Using Docker (Recommended)

1. **Build and Start Postgresql Database:**
   ```sh
   docker-compose up --build
   ```
   This will set up the postgresql database locally. If the database is already there, update the database properties accordingly.

2. **Ensure to export the open ai api key**
   ```sh
   export OPENAI_API_KEY=<your open ai api key>
   ```

3. **Access VEDA:**
   - Run veda.py to access the user interface and connect
    ```sh
    python veda.py
    ```

    *python can be setup with the below instructions.

### 3. Setup Python

1. **Create Python Virtual Environment:**
   ```sh
   python3 -m venv python3
   source python3/bin/activate
   ```

2. **Install Dependencies:**
   ```sh
   pip install -r requirements.txt
   ```

3. **Run the Backend:**
   ```sh
   python veda.py
   ```

---

## Usage

- **Training Data:**  
  The `training/data/` folder contains documentation and sample questions to train VEDA to convert query to SQL queries better and answer queries about property tax and related topics.

- **Database Schema:**  
  The `training/ddl/` folder contains SQL files to set up the necessary database tables. and train VEDA for it.

---
