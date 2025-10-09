# Workflow Summarizer API

AI-powered workflow analytics and summarization system for municipal e-governance applications using FastAPI and Ollama.

## 📋 Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Tech Stack](#tech-stack)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Configuration](#configuration)
- [API Endpoints](#api-endpoints)
- [Usage Examples](#usage-examples)
- [Data Structure](#data-structure)
- [Troubleshooting](#troubleshooting)

## 🎯 Overview

The Workflow Summarizer API provides intelligent analytics and insights for municipal workflow applications. It processes workflow data from multiple CSV sources, merges them intelligently, and generates AI-powered summaries using Ollama's Mistral model.

## ✨ Features

### Core Analytics
- **Module-wise Analytics**: Analyze applications by module (e.g., pgr-services, building-plan)
- **Tenant-wise Analytics**: Get module-wise breakdown for specific tenants
- **Application Tracking**: Track individual application workflows with complete history
- **SLA Monitoring**: Monitor SLA compliance with AT_RISK and BREACHED labels
- **Stuck Applications**: Identify applications delayed with specific roles

### AI-Powered Insights
- Natural language summaries of workflow analytics
- Pointwise breakdowns of module/tenant performance
- Intelligent filtering and categorization

## 🛠 Tech Stack

- **Backend Framework**: FastAPI
- **Data Processing**: Pandas
- **AI Model**: Ollama (Mistral)
- **API Communication**: Python Requests
- **CORS**: Enabled for all origins

## 📦 Prerequisites

### System Requirements
- Python 3.8+
- Ollama installed and running
- 8GB+ RAM recommended

### Required Python Packages
```txt
fastapi
uvicorn
pandas
requests
pydantic
```

### Ollama Setup
1. Install Ollama from [https://ollama.ai](https://ollama.ai)
2. Pull the Mistral model:
   ```bash
   ollama pull mistral
   ```
3. Verify Ollama is running:
   ```bash
   curl http://localhost:11434/api/tags
   ```

## 🚀 Installation

### 1. Clone the Repository
```bash
cd /Users/salaudeenn/Documents/PROJECTS/Workflow\ summazier/backend
```

### 2. Create Virtual Environment
```bash
python3 -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
```

### 3. Install Dependencies
```bash
pip install fastapi uvicorn pandas requests pydantic
```

### 4. Prepare Dataset
Ensure the following CSV files exist in `./Dataset/`:
- `eg_wf_processinstance_v2.csv`
- `eg_wf_businessservice_v2.csv`
- `eg_wf_action_v2.csv`
- `eg_wf_state_v2.csv`

### 5. Start the Server
```bash
uvicorn main:app --reload
```

The API will be available at: `http://127.0.0.1:8000`

## ⚙️ Configuration

### Ollama Configuration
- **Default URL**: `http://localhost:11434`
- **Model**: `mistral`
- **Timeout**: 120 seconds
- **Temperature**: 0.7

### CORS Settings
By default, CORS is enabled for all origins. To restrict:
```python
app.add_middleware(
    CORSMiddleware,
    allow_origins=["http://localhost:3000"],  # Specific origin
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)
```

## 📡 API Endpoints

### 1. **GET /** - Health Check
```bash
curl http://127.0.0.1:8000/
```

**Response:**
```json
{
  "message": "Workflow Summarizer API",
  "total_workflows": 1234
}
```

---

### 2. **POST /workflow-summary** - Get Workflow Analytics

#### Parameters (at least one required):
- `application_number` (string): Business ID (e.g., 'PG-PGR-2025-04-01-000038')
- `module` (string): Module name (e.g., 'pgr-services')
- `tenantid` (string): Tenant ID (e.g., 'pg.citya')
- `businessservice` (string): Business service name (e.g., 'PGR')
- `status` (string): Current state name (e.g., 'APPROVED')
- `sla` (integer): SLA threshold in milliseconds (e.g., 86400000 = 24 hours)

---

#### Use Case 1: Module Analytics (with SLA)

**Request:**
```bash
curl -X POST http://127.0.0.1:8000/workflow-summary \
  -H "Content-Type: application/json" \
  -d '{
    "module": "pgr-services",
    "sla": 86400000
  }'
```

**Response:**
```json
{
  "filters_applied": {
    "module": "pgr-services"
  },
  "module_analytics": {
    "total_applications": 41,
    "status_wise_count": {
      "CLOSEDAFTERRESOLUTION": 1,
      "PENDINGATLME": 6,
      "PENDINGFORASSIGNMENT": 32,
      "PENDINGFORREASSIGNMENT": 2,
      "RESOLVED": 0
    },
    "sla_summary": {
      "within_sla": {
        "count": 20,
        "by_status": {
          "PENDINGFORASSIGNMENT": 18,
          "PENDINGATLME": 2
        }
      },
      "at_risk": {
        "count": 10,
        "by_status": {
          "PENDINGFORASSIGNMENT": 8,
          "PENDINGATLME": 2
        }
      },
      "breached_sla": {
        "count": 11,
        "by_status": {
          "PENDINGFORASSIGNMENT": 6,
          "PENDINGATLME": 2,
          "PENDINGFORREASSIGNMENT": 2,
          "CLOSEDAFTERRESOLUTION": 1
        }
      }
    },
    "sla_details": {
      "within_sla": {
        "applications": [
          {
            "businessid": "PG-PGR-2025-04-01-000038",
            "current_state_name": "PENDINGFORASSIGNMENT",
            "ticket_age_days": 0.5,
            "sla_label": "WITHIN_SLA"
          }
        ]
      },
      "at_risk": {
        "applications": [...]
      },
      "breached_sla": {
        "applications": [...]
      }
    },
    "stuck_applications": [
      {
        "businessid": "PG-PGR-2025-04-01-000045",
        "current_state_name": "PENDINGATLME",
        "ticket_age_days": 3.2,
        "sla_label": "BREACHED",
        "stuck_with_role": "GRO"
      }
    ],
    "analytics_summary": "The pgr-services module has 41 applications. Most applications (32) are pending assignment. 11 applications have breached SLA and require immediate attention..."
  }
}
```

---

#### Use Case 2: Tenant Analytics (Module-wise Breakdown)

**Request:**
```bash
curl -X POST http://127.0.0.1:8000/workflow-summary \
  -H "Content-Type: application/json" \
  -d '{
    "tenantid": "pg.citya"
  }'
```

**Response:**
```json
{
  "filters_applied": {
    "tenantid": "pg.citya"
  },
  "tenant_analytics": {
    "total_applications": 50,
    "overall_status_counts": {
      "PENDING": 30,
      "RESOLVED": 15,
      "CLOSED": 5
    },
    "module_wise_breakdown": {
      "pgr-services": {
        "total_applications": 30,
        "status_wise_count": {
          "PENDING": 20,
          "RESOLVED": 8,
          "CLOSED": 2
        }
      },
      "water-connection": {
        "total_applications": 20,
        "status_wise_count": {
          "PENDING": 10,
          "RESOLVED": 7,
          "CLOSED": 3
        }
      }
    },
    "analytics_summary": "Tenant pg.citya has 50 total applications across 2 modules. pgr-services has the highest volume with 30 applications..."
  }
}
```

---

#### Use Case 3: Individual Application Workflow

**Request:**
```bash
curl -X POST http://127.0.0.1:8000/workflow-summary \
  -H "Content-Type: application/json" \
  -d '{
    "application_number": "PG-PGR-2025-04-01-000038"
  }'
```

**Response:**
```json
{
  "filters_applied": {
    "application_number": "PG-PGR-2025-04-01-000038"
  },
  "total_steps": 5,
  "workflow_history": [
    {
      "businessid": "PG-PGR-2025-04-01-000038",
      "action_name": "APPLY",
      "current_state_name": "PENDINGFORASSIGNMENT",
      "createdtime": 1743436800000,
      "comment": "New complaint registered"
    },
    {
      "businessid": "PG-PGR-2025-04-01-000038",
      "action_name": "ASSIGN",
      "current_state_name": "PENDINGATLME",
      "createdtime": 1743440400000,
      "comment": "Assigned to GRO"
    }
  ],
  "summary": "Application PG-PGR-2025-04-01-000038 was submitted and assigned to GRO. Currently pending at LME for 2 hours..."
}
```

---

## 🔍 SLA Labels Explained

When `sla` parameter is provided, applications are categorized:

| Label | Condition | Description |
|-------|-----------|-------------|
| **WITHIN_SLA** | Age < 80% of SLA | Application progressing normally |
| **AT_RISK** | 80% ≤ Age < 100% of SLA | Approaching deadline, needs attention |
| **BREACHED** | Age ≥ SLA | Exceeded deadline, urgent action needed |

**Note:** Only **non-terminated applications** (`isterminatestate != True`) are included in SLA calculations.

---

## 📊 Data Structure

### Input CSV Files

#### `eg_wf_processinstance_v2.csv`
- Contains workflow instance records
- Key fields: `businessid`, `businessservice`, `tenantid`, `action`, `status`, `createdtime`, `comment`

#### `eg_wf_businessservice_v2.csv`
- Business service definitions
- Key fields: `uuid`, `businessservice`, `tenantid`

#### `eg_wf_action_v2.csv`
- Workflow action definitions
- Key fields: `uuid`, `action`, `currentstate`, `nextstate`, `roles`, `tenantid`

#### `eg_wf_state_v2.csv`
- Workflow state definitions
- Key fields: `uuid`, `state`, `businessserviceid`, `applicationstatus`, `isterminatestate`, `tenantid`

---

## 🐛 Troubleshooting

### Issue: "Error connecting to Ollama"

**Solution:**
```bash
# Check if Ollama is running
curl http://localhost:11434/api/tags

# Start Ollama service
ollama serve

# Verify Mistral model is installed
ollama list
```

---

### Issue: "No workflow found for the provided filters"

**Possible Causes:**
1. Incorrect parameter values
2. CSV files not loaded properly
3. Data mismatch

**Debug:**
```bash
# Check total workflows
curl http://127.0.0.1:8000/

# Verify CSV files exist
ls -la ./Dataset/
```

---

### Issue: SLA showing "SLA not provided"

**Solution:**
You must include the `sla` parameter in milliseconds:
```bash
# 24 hours = 86400000 ms
# 1 hour = 3600000 ms
curl -X POST http://127.0.0.1:8000/workflow-summary \
  -H "Content-Type: application/json" \
  -d '{"module": "pgr-services", "sla": 86400000}'
```

---

### Issue: Slow AI Summary Generation

**Optimizations:**
1. Reduce `num_predict` in Ollama config (line 291, 350, 424)
2. Use a faster model: `ollama pull phi`
3. Increase timeout if needed

---

## 📝 Common SLA Values

| Duration | Milliseconds |
|----------|--------------|
| 1 hour | 3600000 |
| 6 hours | 21600000 |
| 12 hours | 43200000 |
| 24 hours | 86400000 |
| 48 hours | 172800000 |
| 7 days | 604800000 |

---

## 🔒 Security Notes

⚠️ **Production Deployment:**
1. Restrict CORS origins
2. Add authentication middleware
3. Implement rate limiting
4. Validate and sanitize all inputs
5. Use environment variables for configuration
6. Enable HTTPS

---

## 📚 Additional Resources

- [FastAPI Documentation](https://fastapi.tiangolo.com/)
- [Ollama Documentation](https://ollama.ai/docs)
- [Pandas Documentation](https://pandas.pydata.org/docs/)

---

## 📄 License

This project is provided as-is for municipal e-governance workflow management.

---

## 🤝 Support

For issues or questions:
1. Check the [Troubleshooting](#troubleshooting) section
2. Verify Ollama is running with the Mistral model
3. Review API endpoint documentation
4. Check CSV data integrity

---

**Generated with AI-powered workflow analytics** 🤖
