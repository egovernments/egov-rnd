# HCM Campaign Calendar - AI Backend

> **Intelligent RAG-powered API for Health Campaign Management**

A FastAPI-based AI service that powers natural language interaction, intelligent scheduling, and analytics for multi-country health campaign management. Built for the eGov DIGIT Hackathon.

---

## 🎯 Purpose

Transform health campaign management through AI by enabling:
- **Natural Language Queries** - Understanding complex campaign questions
- **Intelligent Document Processing** - Extract insights from PDFs and Excel files
- **Smart Scheduling** - Detect conflicts and optimize timelines
- **Predictive Analytics** - Forecast campaign success and risks

---

## 🧠 Core AI Capabilities

### 1. **RAG (Retrieval-Augmented Generation) Pipeline**
Process campaign documents, guidelines, and schedules to provide accurate, source-backed answers.

### 2. **Semantic Search**
Understand context and intent behind queries like:
- *"Which campaigns in Rwanda are delayed?"*
- *"Show training dates for West Africa next quarter"*
- *"List all malaria campaigns with pending approvals"*

### 3. **Conflict Detection** (Planned)
Automatically identify scheduling conflicts:
- Overlapping campaign dates
- Resource allocation clashes
- Team availability issues

### 4. **Predictive Analytics** (Planned)
ML-powered insights:
- Campaign success probability
- Delay risk factors
- Optimal go-live timing

---

## 🚀 Features

### Current (MVP)
- ✅ **PDF Document Processing**: Extract and index campaign guidelines
- ✅ **Natural Language API**: Question-answering with source attribution
- ✅ **Semantic Search**: Context-aware information retrieval
- ✅ **RESTful API**: FastAPI with auto-generated documentation
- ✅ **CORS Support**: Frontend integration ready
- ✅ **Real-time Processing**: <3 second query responses

### Planned (Phase 2)
- 🔜 **Excel Import**: Parse legacy campaign calendars
- 🔜 **Scheduling AI**: Conflict detection algorithms
- 🔜 **Analytics Engine**: Campaign statistics and trends
- 🔜 **Email/Chat Integration**: Auto-extract status updates
- 🔜 **Database Integration**: PostgreSQL for persistent storage

---

## 🛠️ Tech Stack

| Component | Technology | Purpose |
|-----------|-----------|---------|
| **Framework** | FastAPI | High-performance async API |
| **AI/ML** | HuggingFace Transformers | LLM for generation |
| | Sentence Transformers | Semantic embeddings |
| | PyTorch | ML model inference |
| **Server** | Uvicorn | ASGI server |
| **Data Processing** | pandas, NumPy | Analytics and stats |
| **PDF Parsing** | PyPDF2 / pdfplumber | Document extraction |

---

## 📋 Prerequisites

- **Python**: 3.8 or higher
- **RAM**: 8GB minimum (16GB recommended)
- **GPU**: Optional (significantly faster inference)
- **Storage**: 2GB for model downloads

---

## 🔧 Installation

### 1. Install Dependencies

```bash
cd backend-ai
pip install -r requirements.txt
```

**Key Dependencies:**
```
fastapi>=0.104.0
uvicorn[standard]>=0.24.0
sentence-transformers>=2.2.2
torch>=2.0.0
transformers>=4.30.0
python-multipart>=0.0.6
pandas>=2.0.0
```

### 2. Download AI Models

First run automatically downloads:
- **Sentence Transformer** (~100MB): `all-MiniLM-L6-v2`
- **LLM** (varies): Configurable in `RAG.py`

Expected download time: 2-5 minutes on good connection

### 3. Prepare Sample Document

```bash
# Place a sample campaign PDF
cp /path/to/campaign_guide.pdf backend-ai/design_system.pdf
```

Or modify startup in `server.py`:
```python
@app.on_event("startup")
async def load_rag():
    global DOCUMENT_STORE, EMBEDDINGS
    DOCUMENT_STORE, EMBEDDINGS = init_rag("your_document.pdf")
```

---

## 🚀 Running the Server

### Development Mode

```bash
python server.py
```

Output:
```
INFO:     Started server process
INFO:     Uvicorn running on http://0.0.0.0:8000
```

### Production Mode

```bash
# Single worker
uvicorn server:app --host 0.0.0.0 --port 8000

# Multiple workers (CPU cores)
uvicorn server:app --host 0.0.0.0 --port 8000 --workers 4
```

### Health Check

```bash
curl http://localhost:8000/docs
# Opens interactive API documentation
```

---

## 📡 API Endpoints

### 1. **Natural Language Query**

Ask questions about campaign data in plain language.

**Endpoint:** `POST /ask`

**Request:**
```json
{
  "query": "What are the vaccination campaign dates for Kenya in 2024?"
}
```

**Response:**
```json
{
  "query": "What are the vaccination campaign dates for Kenya in 2024?",
  "answer": "Based on the campaign schedule, Kenya has three vaccination campaigns in 2024: Polio vaccination from March 15-20, Measles from June 10-15, and COVID-19 booster from September 1-10.",
  "sources": [
    {
      "page_number": 12,
      "text_snippet": "Kenya - Polio Campaign: March 15-20, 2024. Target population: children under 5...",
      "score": 0.89
    },
    {
      "page_number": 15,
      "text_snippet": "Measles vaccination Kenya Q2 2024: June 10-15. Coverage target: 95%...",
      "score": 0.85
    }
  ]
}
```

### 2. **Upload Campaign Document**

Upload PDF documents (guidelines, schedules, reports).

**Endpoint:** `POST /upload_pdf`

**Request:**
```bash
curl -X POST "http://localhost:8000/upload_pdf" \
  -F "file=@campaign_schedule_2024.pdf"
```

**Response:**
```json
{
  "status": "PDF uploaded and processed",
  "chunks": 247
}
```

### 3. **API Documentation**

- **Swagger UI**: http://localhost:8000/docs (interactive testing)
- **ReDoc**: http://localhost:8000/redoc (clean documentation)
- **OpenAPI JSON**: http://localhost:8000/openapi.json

---

## 📁 Project Structure

```
backend-ai/
├── server.py              # FastAPI application
│   ├── /ask endpoint      # Natural language queries
│   ├── /upload_pdf        # Document upload
│   └── CORS config        # Frontend integration
│
├── RAG.py                 # AI Pipeline
│   ├── init_rag()         # Initialize RAG system
│   ├── retrieve_relevant_resources()  # Semantic search
│   ├── prompt_formatter() # Context-aware prompts
│   └── llm_model          # Language model
│
├── requirements.txt       # Python dependencies
├── design_system.pdf      # Default sample document
│
└── (future)
    ├── scheduler.py       # AI scheduling algorithms
    ├── analytics.py       # Campaign statistics
    └── database.py        # PostgreSQL models
```

---

## 🧩 RAG Pipeline Deep Dive

### Architecture Flow

```
┌─────────────────┐
│  User Query     │ "What campaigns are delayed in Kenya?"
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│ Query Embedding │ Convert to 384-dim vector
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│ Similarity      │ Find top-5 relevant chunks
│ Search          │ using cosine similarity
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│ Context         │ Retrieved chunks + query
│ Assembly        │ formatted as prompt
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│ LLM Generation  │ Generate natural answer
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│ Answer Cleaning │ Extract final response
│ & Attribution   │ with source references
└─────────────────┘
```

### Implementation (`RAG.py`)

**1. Document Initialization**
```python
def init_rag(pdf_path):
    # Extract text from PDF
    pages_and_chunks = pdf_to_chunks(pdf_path)

    # Generate embeddings
    embeddings = embed_chunks(pages_and_chunks)

    return pages_and_chunks, embeddings
```

**2. Semantic Retrieval**
```python
def retrieve_relevant_resources(query, embeddings, top_k=5):
    # Embed query
    query_embedding = embedding_model.encode(query)

    # Cosine similarity
    scores = util.cos_sim(query_embedding, embeddings)[0]

    # Get top-k indices
    top_results = torch.topk(scores, k=top_k)

    return top_results.values, top_results.indices
```

**3. Prompt Construction**
```python
def prompt_formatter(query, context_items):
    context = "\n\n".join([item["sentence_chunk"] for item in context_items])

    prompt = f"""Based on the following context, answer the query.

Context:
{context}

Query: {query}

Answer:"""

    return prompt
```

**4. Answer Generation**
```python
def generate_answer(prompt):
    inputs = tokenizer(prompt, return_tensors="pt")
    outputs = llm_model.generate(**inputs, max_new_tokens=256)
    answer = tokenizer.decode(outputs[0], skip_special_tokens=True)
    return answer
```

---

## ⚙️ Configuration

### Model Selection

**Embedding Model** (`RAG.py`)
```python
from sentence_transformers import SentenceTransformer

# Recommended: Fast and accurate
embedding_model = SentenceTransformer('all-MiniLM-L6-v2')

# Alternatives:
# - 'all-mpnet-base-v2' (slower, more accurate)
# - 'paraphrase-multilingual-MiniLM-L12-v2' (multi-language)
```

**LLM Model** (`RAG.py`)
```python
from transformers import AutoModelForCausalLM, AutoTokenizer

# Configure your preferred model
model_name = "gpt2"  # or "facebook/opt-1.3b", etc.
llm_model = AutoModelForCausalLM.from_pretrained(model_name)
tokenizer = AutoTokenizer.from_pretrained(model_name)
```

### Chunking Strategy

```python
# In RAG.py - optimize for your documents
chunk_size = 500      # characters per chunk
overlap = 50          # overlap between chunks
sentence_split = True # split on sentence boundaries
```

### Retrieval Parameters

```python
# Number of context chunks to retrieve
top_k = 5  # Increase for more context, decrease for speed

# Similarity threshold (optional)
min_score = 0.3  # Only return chunks above this score
```

### CORS Configuration

**Allow specific origins** (`server.py`):
```python
app.add_middleware(
    CORSMiddleware,
    allow_origins=[
        "http://localhost:3000",
        "https://your-production-domain.com"
    ],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)
```

---

## 🧪 Testing

### Interactive Testing (Swagger UI)

1. Open http://localhost:8000/docs
2. Click "POST /ask"
3. Click "Try it out"
4. Enter query: `{"query": "What is this document about?"}`
5. Click "Execute"

### cURL Testing

```bash
# Upload document
curl -X POST "http://localhost:8000/upload_pdf" \
  -H "accept: application/json" \
  -F "file=@campaign_guide.pdf"

# Ask question
curl -X POST "http://localhost:8000/ask" \
  -H "Content-Type: application/json" \
  -d '{"query": "List all campaigns in Rwanda"}'
```

### Python Testing

```python
import requests

# Upload PDF
with open("campaign_schedule.pdf", "rb") as f:
    response = requests.post(
        "http://localhost:8000/upload_pdf",
        files={"file": f}
    )
    print(response.json())

# Query
response = requests.post(
    "http://localhost:8000/ask",
    json={"query": "What are the key milestones?"}
)
print(response.json()["answer"])
```

---

## 🚀 Performance Optimization

### GPU Acceleration

**Enable CUDA** (if GPU available):
```python
import torch

device = "cuda" if torch.cuda.is_available() else "cpu"
embedding_model = embedding_model.to(device)
llm_model = llm_model.to(device)
```

**Check GPU usage:**
```bash
nvidia-smi  # Monitor GPU memory
```

### Response Time Optimization

| Optimization | Impact | Trade-off |
|--------------|--------|-----------|
| Reduce `top_k` (5→3) | 20% faster | Less context |
| Smaller LLM | 50% faster | Lower quality |
| GPU acceleration | 3-10x faster | Requires GPU |
| Chunk caching | 30% faster | Memory usage |

### Caching Strategy (Future)

```python
from functools import lru_cache

@lru_cache(maxsize=100)
def cached_query(query_text):
    # Cache frequent queries
    return process_query(query_text)
```

---

## 🐛 Troubleshooting

### Common Issues

**1. Out of Memory**
```
RuntimeError: CUDA out of memory
```

**Solutions:**
- Use smaller model (GPT-2 instead of GPT-2-large)
- Reduce chunk size
- Lower `max_new_tokens` in generation
- Use CPU instead of GPU

**2. Slow Responses (>10 seconds)**

**Solutions:**
- Enable GPU if available
- Use smaller embedding model
- Reduce `top_k` retrieval count
- Implement caching

**3. Import Errors**
```
ModuleNotFoundError: No module named 'sentence_transformers'
```

**Solution:**
```bash
pip install -r requirements.txt --upgrade
pip install sentence-transformers --force-reinstall
```

**4. CORS Errors from Frontend**

**Solution:**
Check `server.py` has correct origin:
```python
allow_origins=["http://localhost:3000"]
```

---

## 📊 Future Enhancements

### Phase 2: Campaign Intelligence

**1. Excel Import & Analysis**
```python
@app.post("/campaigns/import")
async def import_excel(file: UploadFile):
    df = pd.read_excel(file.file)
    # Parse campaigns, validate, store
    return {"campaigns_imported": len(df)}
```

**2. Conflict Detection**
```python
@app.post("/conflicts/detect")
async def detect_conflicts():
    conflicts = []
    for c1, c2 in campaign_pairs:
        if overlaps(c1.dates, c2.dates):
            conflicts.append({"campaign1": c1, "campaign2": c2})
    return {"conflicts": conflicts}
```

**3. Analytics Engine**
```python
@app.get("/analytics/summary")
async def campaign_analytics(
    country: str = None,
    date_from: date = None,
    date_to: date = None
):
    stats = {
        "total_campaigns": count_campaigns(country, date_from, date_to),
        "avg_duration": average_duration(),
        "completion_rate": completion_percentage(),
        "trends": calculate_trends()
    }
    return stats
```

---

## 🔒 Security

### Production Checklist

- [ ] Add API authentication (JWT tokens)
- [ ] Implement rate limiting (10 requests/minute)
- [ ] Validate file uploads (size, type, content)
- [ ] Sanitize user inputs (prevent injection)
- [ ] Enable HTTPS only
- [ ] Add audit logging
- [ ] Configure firewall rules
- [ ] Set up monitoring alerts

### File Upload Security

```python
MAX_FILE_SIZE = 10 * 1024 * 1024  # 10MB
ALLOWED_EXTENSIONS = {".pdf", ".xlsx", ".csv"}

@app.post("/upload_pdf")
async def upload_pdf(file: UploadFile):
    # Validate size
    if file.size > MAX_FILE_SIZE:
        raise HTTPException(400, "File too large")

    # Validate extension
    if not file.filename.endswith(tuple(ALLOWED_EXTENSIONS)):
        raise HTTPException(400, "Invalid file type")

    # Process safely...
```

---

## 📚 Resources

- [FastAPI Documentation](https://fastapi.tiangolo.com/)
- [Sentence Transformers](https://www.sbert.net/)
- [HuggingFace Transformers](https://huggingface.co/docs/transformers/)
- [RAG Best Practices](https://www.pinecone.io/learn/retrieval-augmented-generation/)

---

## 🤝 Contributing

For hackathon and future development:

1. **Code Quality**: PEP 8 compliance, type hints
2. **Documentation**: Docstrings for all functions
3. **Testing**: Unit tests for critical paths
4. **Performance**: Profile before optimizing
5. **Security**: Never commit credentials

---

## 📄 License

Part of eGov DIGIT Hackathon - HCM Campaign Calendar Project

---

**Powered by FastAPI & AI for intelligent campaign management** 🚀
