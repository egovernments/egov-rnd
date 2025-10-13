from fastapi import FastAPI, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel
from typing import Dict, Any, List, Optional
import uvicorn
import os
from dotenv import load_dotenv

from services.nlp_processor import NLPProcessor
from services.query_router import QueryRouter
from services.elasticsearch_service import ElasticsearchService
from services.postgresql_service import PostgreSQLService
from services.data_merger import DataMerger

load_dotenv()

app = FastAPI(
    title="Hackathon Chatbot API",
    description="Natural Language Query Tool for Elasticsearch & PostgreSQL",
    version="1.0.0"
)

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Initialize services
nlp_processor = NLPProcessor()
es_service = ElasticsearchService()
pg_service = PostgreSQLService()
query_router = QueryRouter()
data_merger = DataMerger()

class ChatRequest(BaseModel):
    message: str
    conversation_id: Optional[str] = None

class ChatResponse(BaseModel):
    response: str
    data: Optional[Dict[str, Any]] = None
    query_info: Optional[Dict[str, Any]] = None
    conversation_id: str

@app.on_event("startup")
async def startup_event():
    """Initialize connections and download models"""
    await es_service.initialize()
    await pg_service.initialize()
    await nlp_processor.initialize()

@app.get("/")
async def root():
    return {"message": "Hackathon Chatbot API is running!"}

@app.get("/health")
async def health_check():
    """Health check endpoint"""
    es_status = await es_service.health_check()
    pg_status = await pg_service.health_check()
    
    return {
        "status": "healthy" if es_status and pg_status else "degraded",
        "elasticsearch": es_status,
        "postgresql": pg_status
    }

@app.post("/chat", response_model=ChatResponse)
async def chat(request: ChatRequest):
    """Main chat endpoint that processes natural language queries"""
    try:
        # Process the natural language query
        nlp_result = await nlp_processor.process_query(request.message)
        
        # Route query to appropriate services
        routing_decision = await query_router.route_query(nlp_result)
        
        results = {}
        
        # Query Elasticsearch if needed
        if routing_decision.get("use_elasticsearch", False):
            es_query = routing_decision.get("elasticsearch_query")
            es_results = await es_service.search(es_query)
            results["elasticsearch"] = es_results
        
        # Query PostgreSQL if needed
        if routing_decision.get("use_postgresql", False):
            pg_query = routing_decision.get("postgresql_query")
            pg_results = await pg_service.query(pg_query)
            results["postgresql"] = pg_results
        
        # Merge and format results
        merged_data = await data_merger.merge_results(results, nlp_result)
        
        # Generate natural language response
        response_text = await nlp_processor.generate_response(
            request.message, 
            merged_data, 
            nlp_result
        )
        
        return ChatResponse(
            response=response_text,
            data=merged_data,
            query_info={
                "intent": nlp_result.get("intent"),
                "entities": nlp_result.get("entities"),
                "routing": routing_decision
            },
            conversation_id=request.conversation_id or "default"
        )
        
    except Exception as e:
        raise HTTPException(status_code=500, detail=f"Error processing query: {str(e)}")

@app.get("/schema/elasticsearch")
async def get_es_schema():
    """Get Elasticsearch index mapping"""
    return await es_service.get_mapping()

@app.get("/schema/postgresql")
async def get_pg_schema():
    """Get PostgreSQL table schemas"""
    return await pg_service.get_schema()

if __name__ == "__main__":
    uvicorn.run(
        app, 
        host=os.getenv("API_HOST", "0.0.0.0"), 
        port=int(os.getenv("API_PORT", 8000))
    )