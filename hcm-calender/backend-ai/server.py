from fastapi import FastAPI, UploadFile, File
from pydantic import BaseModel
from fastapi.middleware.cors import CORSMiddleware
import re
import uvicorn
from RAG import (
    retrieve_relevant_resources,
    prompt_formatter,
    llm_model,
    tokenizer,
    init_rag,
    pages_and_chunks)
import torch

app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["http://localhost:3000"],  # frontend URL
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Globals to allow updates after PDF upload
DOCUMENT_STORE = []
EMBEDDINGS = None


@app.on_event("startup")
async def load_rag():
    global DOCUMENT_STORE, EMBEDDINGS
    DOCUMENT_STORE, EMBEDDINGS = init_rag("design_system.pdf")

class QueryRequest(BaseModel):
    query: str

@app.post("/ask")
def ask(request: QueryRequest):
    """Answer a query using the RAG pipeline."""
    query = request.query
    if not query or EMBEDDINGS is None:
        return {"error": "No query provided or no document uploaded"}

    # Step 1: Retrieve top-k chunks
    scores, indices = retrieve_relevant_resources(query=query, embeddings=EMBEDDINGS)
    context_items = [DOCUMENT_STORE[i] for i in indices]

    # Step 2: Format prompt
    prompt = prompt_formatter(query=query, context_items=context_items)
    input_ids = tokenizer(str(prompt), return_tensors="pt").to("cpu")

    # Step 3: Generate answer
    outputs = llm_model.generate(**input_ids, max_new_tokens=256)
    raw_answer = tokenizer.decode(outputs[0], skip_special_tokens=True)

    # Step 4: Clean answer
    if "Answer:" in raw_answer:
        clean_answer = raw_answer.split("Answer:", 1)[-1].strip()
    else:
        sentences = re.split(r'(?<=[.!?])\s+', raw_answer.strip())
        clean_answer = " ".join(sentences[-5:]).strip()

    # Step 5: Prepare sources (trimmed for readability)
    sources = [
        {
            "page_number": int(item.get("page_number", -1)),
            "text_snippet": item.get("sentence_chunk", "")[:250],
            "score": float(score)
        }
        for score, idx in zip(scores, indices)
        for item in [DOCUMENT_STORE[idx]]
    ]

    return {
        "query": query,
        "answer": clean_answer,
        "sources": sources
    }




# For PDF uploads (optional)
@app.post("/upload_pdf")
async def upload_pdf(file: UploadFile = File(...)):
    file_path = file.filename
    with open(file_path, "wb") as f:
        f.write(await file.read())

    global DOCUMENT_STORE, EMBEDDINGS
    DOCUMENT_STORE, EMBEDDINGS = init_rag(file_path)

    return {"status": "PDF uploaded and processed", "chunks": len(DOCUMENT_STORE)}


if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=8000)