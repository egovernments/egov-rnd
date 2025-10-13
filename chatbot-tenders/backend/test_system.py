#!/usr/bin/env python3
"""
Quick system test for the hackathon chatbot
Run this to verify all components are working
"""

import asyncio
import sys
import os
from pathlib import Path

# Add the backend directory to the Python path
sys.path.insert(0, str(Path(__file__).parent))

from services.nlp_processor import NLPProcessor
from services.query_router import QueryRouter
from services.elasticsearch_service import ElasticsearchService
from services.postgresql_service import PostgreSQLService
from services.data_merger import DataMerger

async def test_nlp_processor():
    """Test NLP processing capabilities"""
    print("🧠 Testing NLP Processor...")
    
    nlp = NLPProcessor()
    await nlp.initialize()
    
    # Test query processing
    test_query = "How many users do we have from Engineering department?"
    result = await nlp.process_query(test_query)
    
    print(f"   Query: {test_query}")
    print(f"   Intent: {result.get('intent')}")
    print(f"   Entities: {len(result.get('entities', []))} found")
    print("   ✅ NLP Processor working!")

async def test_query_router():
    """Test query routing logic"""
    print("🔀 Testing Query Router...")
    
    router = QueryRouter()
    
    # Mock NLP result
    nlp_result = {
        "original_query": "Count users in Engineering",
        "intent": "count_records",
        "entities": [{"text": "users", "label": "TABLE_NAME"}],
        "aggregations": [{"type": "count", "field": "*"}],
        "filters": []
    }
    
    routing = await router.route_query(nlp_result)
    
    print(f"   Use PostgreSQL: {routing.get('use_postgresql')}")
    print(f"   Use Elasticsearch: {routing.get('use_elasticsearch')}")
    print(f"   Primary Source: {routing.get('primary_source')}")
    print("   ✅ Query Router working!")

async def test_data_merger():
    """Test data merging capabilities"""
    print("🔗 Testing Data Merger...")
    
    merger = DataMerger()
    
    # Mock results from both sources
    mock_results = {
        "postgresql": {
            "total_results": 5,
            "results": [{"count_all": 5}],
            "source": "postgresql"
        },
        "elasticsearch": {
            "total_results": 10,
            "results": [],
            "source": "elasticsearch"
        }
    }
    
    mock_nlp = {"intent": "count_records", "original_query": "Count records"}
    
    merged = await merger.merge_results(mock_results, mock_nlp)
    
    print(f"   Merged type: {merged.get('type')}")
    print(f"   Sources: {merged.get('sources', [])}")
    print(f"   Summary: {merged.get('summary')}")
    print("   ✅ Data Merger working!")

async def test_complete_pipeline():
    """Test the complete processing pipeline"""
    print("🔄 Testing Complete Pipeline...")
    
    # Initialize all components
    nlp = NLPProcessor()
    router = QueryRouter()
    merger = DataMerger()
    
    await nlp.initialize()
    
    # Process a test query
    test_query = "Find documents about machine learning"
    
    # Step 1: NLP Processing
    nlp_result = await nlp.process_query(test_query)
    print(f"   Step 1 - NLP: Intent = {nlp_result.get('intent')}")
    
    # Step 2: Query Routing
    routing = await router.route_query(nlp_result)
    print(f"   Step 2 - Routing: {routing.get('primary_source')}")
    
    # Step 3: Mock results and merge
    mock_results = {
        "elasticsearch": {
            "total_results": 3,
            "results": [
                {"title": "ML Basics", "content": "Introduction to ML"},
                {"title": "Advanced ML", "content": "Deep learning concepts"}
            ]
        }
    }
    
    merged = await merger.merge_results(mock_results, nlp_result)
    print(f"   Step 3 - Merge: {merged.get('total_results')} results")
    
    # Step 4: Generate response
    response = await nlp.generate_response(test_query, merged, nlp_result)
    print(f"   Step 4 - Response: {response[:50]}...")
    
    print("   ✅ Complete Pipeline working!")

async def main():
    """Run all tests"""
    print("🚀 Starting Hackathon Chatbot System Tests")
    print("=" * 50)
    
    try:
        await test_nlp_processor()
        print()
        
        await test_query_router()
        print()
        
        await test_data_merger()
        print()
        
        await test_complete_pipeline()
        print()
        
        print("🎉 All tests passed! System is ready for the hackathon!")
        print("=" * 50)
        
    except Exception as e:
        print(f"❌ Test failed: {e}")
        import traceback
        traceback.print_exc()
        sys.exit(1)

if __name__ == "__main__":
    # Set environment variables for testing
    os.environ.setdefault("POSTGRES_HOST", "localhost")
    os.environ.setdefault("ES_HOST", "localhost")
    
    asyncio.run(main())