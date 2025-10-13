from elasticsearch import AsyncElasticsearch
from typing import Dict, List, Any, Optional
import json
import os
from datetime import datetime, timedelta
import asyncio

class ElasticsearchService:
    def __init__(self):
        self.es = None
        self.index_name = os.getenv("ES_INDEX", "hackathon_index")
        self.host = os.getenv("ES_HOST", "localhost")
        self.port = int(os.getenv("ES_PORT", 9200))
        
    async def initialize(self):
        """Initialize Elasticsearch connection"""
        try:
            self.es = AsyncElasticsearch([
                f"http://{self.host}:{self.port}"
            ])
            
            # Test connection
            await self.es.ping()
            print(f"Connected to Elasticsearch at {self.host}:{self.port}")
            
            # Create index if it doesn't exist
            await self._create_index_if_not_exists()
            
        except Exception as e:
            print(f"Error connecting to Elasticsearch: {e}")
            print("Note: Make sure Elasticsearch is running and accessible")
            
    async def _create_index_if_not_exists(self):
        """Create the index with appropriate mapping if it doesn't exist"""
        try:
            exists = await self.es.indices.exists(index=self.index_name)
            if not exists:
                mapping = {
                    "mappings": {
                        "properties": {
                            "id": {"type": "keyword"},
                            "title": {"type": "text", "analyzer": "standard"},
                            "content": {"type": "text", "analyzer": "standard"},
                            "category": {"type": "keyword"},
                            "tags": {"type": "keyword"},
                            "author": {"type": "keyword"},
                            "created_at": {"type": "date"},
                            "updated_at": {"type": "date"},
                            "status": {"type": "keyword"},
                            "metadata": {"type": "object"},
                            "score": {"type": "float"},
                            "views": {"type": "integer"},
                            "likes": {"type": "integer"}
                        }
                    },
                    "settings": {
                        "number_of_shards": 1,
                        "number_of_replicas": 0,
                        "analysis": {
                            "analyzer": {
                                "custom_analyzer": {
                                    "type": "custom",
                                    "tokenizer": "standard",
                                    "filter": ["lowercase", "stop"]
                                }
                            }
                        }
                    }
                }
                
                await self.es.indices.create(
                    index=self.index_name,
                    body=mapping
                )
                print(f"Created Elasticsearch index: {self.index_name}")
                
                # Add sample data
                await self._add_sample_data()
                
        except Exception as e:
            print(f"Error creating Elasticsearch index: {e}")
    
    async def _add_sample_data(self):
        """Add sample data to the index for testing"""
        sample_docs = [
            {
                "id": "doc1",
                "title": "Introduction to Machine Learning",
                "content": "Machine learning is a subset of artificial intelligence that focuses on algorithms and statistical models.",
                "category": "education",
                "tags": ["ml", "ai", "technology"],
                "author": "john_doe",
                "created_at": "2024-01-15T10:00:00Z",
                "status": "published",
                "score": 4.5,
                "views": 1250,
                "likes": 89
            },
            {
                "id": "doc2",
                "title": "Data Science Best Practices",
                "content": "Best practices for data science include proper data cleaning, feature engineering, and model validation.",
                "category": "tutorial",
                "tags": ["data-science", "best-practices", "analytics"],
                "author": "jane_smith",
                "created_at": "2024-01-20T14:30:00Z",
                "status": "published",
                "score": 4.8,
                "views": 2100,
                "likes": 156
            },
            {
                "id": "doc3",
                "title": "Database Performance Optimization",
                "content": "Optimizing database performance involves indexing strategies, query optimization, and proper schema design.",
                "category": "technical",
                "tags": ["database", "performance", "optimization"],
                "author": "mike_wilson",
                "created_at": "2024-01-25T09:15:00Z",
                "status": "draft",
                "score": 4.2,
                "views": 890,
                "likes": 67
            },
            {
                "id": "doc4",
                "title": "Cloud Computing Trends 2024",
                "content": "The latest trends in cloud computing include serverless architecture, edge computing, and multi-cloud strategies.",
                "category": "technology",
                "tags": ["cloud", "trends", "serverless"],
                "author": "sarah_johnson",
                "created_at": "2024-02-01T16:45:00Z",
                "status": "published",
                "score": 4.6,
                "views": 1800,
                "likes": 134
            },
            {
                "id": "doc5",
                "title": "Cybersecurity Fundamentals",
                "content": "Understanding cybersecurity fundamentals is crucial for protecting digital assets and maintaining privacy.",
                "category": "security",
                "tags": ["cybersecurity", "security", "privacy"],
                "author": "alex_brown",
                "created_at": "2024-02-05T11:20:00Z",
                "status": "published",
                "score": 4.7,
                "views": 1650,
                "likes": 122
            }
        ]
        
        for doc in sample_docs:
            try:
                await self.es.index(
                    index=self.index_name,
                    id=doc["id"],
                    body=doc
                )
            except Exception as e:
                print(f"Error adding sample document {doc['id']}: {e}")
        
        # Refresh index to make documents searchable
        await self.es.indices.refresh(index=self.index_name)
        print(f"Added {len(sample_docs)} sample documents to Elasticsearch")
    
    async def search(self, query_params: Dict[str, Any]) -> Dict[str, Any]:
        """Execute search query on Elasticsearch"""
        try:
            if not self.es:
                return {"error": "Elasticsearch not initialized", "results": []}
            
            # Build Elasticsearch query
            es_query = self._build_es_query(query_params)
            
            # Execute search
            response = await self.es.search(
                index=self.index_name,
                body=es_query,
                size=query_params.get("limit", 50)
            )
            
            # Process results
            return self._process_search_results(response, query_params)
            
        except Exception as e:
            print(f"Error executing Elasticsearch search: {e}")
            return {"error": str(e), "results": []}
    
    def _build_es_query(self, query_params: Dict[str, Any]) -> Dict[str, Any]:
        """Build Elasticsearch query from parameters"""
        query = {
            "query": {
                "bool": {
                    "must": [],
                    "filter": [],
                    "should": [],
                    "must_not": []
                }
            },
            "sort": [],
            "aggs": {}
        }
        
        # Text search
        search_text = query_params.get("search_text", "")
        if search_text:
            query["query"]["bool"]["must"].append({
                "multi_match": {
                    "query": search_text,
                    "fields": ["title^3", "content^2", "tags", "author"],
                    "type": "best_fields",
                    "fuzziness": "AUTO"
                }
            })
        
        # Apply filters
        filters = query_params.get("filters", [])
        for filter_item in filters:
            es_filter = self._convert_filter_to_es(filter_item)
            if es_filter:
                query["query"]["bool"]["filter"].append(es_filter)
        
        # Handle temporal constraints
        temporal_info = query_params.get("temporal_info", {})
        if temporal_info.get("has_time_constraint"):
            time_filter = self._build_time_filter(temporal_info)
            if time_filter:
                query["query"]["bool"]["filter"].append(time_filter)
        
        # Add aggregations
        aggregations = query_params.get("aggregations", [])
        for agg in aggregations:
            agg_query = self._build_aggregation(agg)
            if agg_query:
                query["aggs"].update(agg_query)
        
        # Sorting
        sort_field = query_params.get("sort_field", "_score")
        sort_order = query_params.get("sort_order", "desc")
        
        if sort_field == "_score":
            query["sort"].append({"_score": {"order": sort_order}})
        else:
            query["sort"].append({sort_field: {"order": sort_order}})
        
        # If no must clauses, use match_all
        if not query["query"]["bool"]["must"] and not search_text:
            query["query"] = {"match_all": {}}
        
        return query
    
    def _convert_filter_to_es(self, filter_item: Dict[str, Any]) -> Optional[Dict[str, Any]]:
        """Convert filter to Elasticsearch format"""
        field = filter_item.get("field")
        operator = filter_item.get("operator")
        value = filter_item.get("value")
        filter_type = filter_item.get("type")
        
        if not field or not operator:
            return None
        
        if operator == "=" or operator == "is":
            return {"term": {field: value}}
        elif operator == "!=" or operator == "is_not":
            return {"bool": {"must_not": {"term": {field: value}}}}
        elif operator == ">":
            return {"range": {field: {"gt": value}}}
        elif operator == ">=":
            return {"range": {field: {"gte": value}}}
        elif operator == "<":
            return {"range": {field: {"lt": value}}}
        elif operator == "<=":
            return {"range": {field: {"lte": value}}}
        elif operator == "contains":
            return {"wildcard": {field: f"*{value}*"}}
        elif operator == "between" and isinstance(value, list) and len(value) == 2:
            return {"range": {field: {"gte": value[0], "lte": value[1]}}}
        
        return None
    
    def _build_time_filter(self, temporal_info: Dict[str, Any]) -> Optional[Dict[str, Any]]:
        """Build time-based filter for Elasticsearch"""
        if not temporal_info.get("has_time_constraint"):
            return None
        
        relative_time = temporal_info.get("relative_time")
        if not relative_time:
            return None
        
        now = datetime.now()
        
        if "days" in relative_time:
            days = relative_time["days"]
            if days == 0:  # today
                start_time = now.replace(hour=0, minute=0, second=0, microsecond=0)
                end_time = now.replace(hour=23, minute=59, second=59, microsecond=999999)
            else:
                start_time = now + timedelta(days=days)
                end_time = now
        elif "months" in relative_time:
            # Approximate month calculation
            days = relative_time["months"] * 30
            start_time = now + timedelta(days=days)
            end_time = now
        elif "years" in relative_time:
            # Approximate year calculation
            days = relative_time["years"] * 365
            start_time = now + timedelta(days=days)
            end_time = now
        else:
            return None
        
        return {
            "range": {
                "created_at": {
                    "gte": start_time.isoformat(),
                    "lte": end_time.isoformat()
                }
            }
        }
    
    def _build_aggregation(self, agg: Dict[str, Any]) -> Optional[Dict[str, Any]]:
        """Build aggregation query for Elasticsearch"""
        agg_type = agg.get("type")
        field = agg.get("field")
        
        if not agg_type or not field:
            return None
        
        agg_name = f"{agg_type}_{field}"
        
        if agg_type == "count":
            return {agg_name: {"value_count": {"field": field}}}
        elif agg_type == "sum":
            return {agg_name: {"sum": {"field": field}}}
        elif agg_type == "avg":
            return {agg_name: {"avg": {"field": field}}}
        elif agg_type == "max":
            return {agg_name: {"max": {"field": field}}}
        elif agg_type == "min":
            return {agg_name: {"min": {"field": field}}}
        elif agg_type == "group_by":
            return {agg_name: {"terms": {"field": field, "size": 100}}}
        
        return None
    
    def _process_search_results(self, response: Dict[str, Any], query_params: Dict[str, Any]) -> Dict[str, Any]:
        """Process Elasticsearch search results"""
        hits = response.get("hits", {})
        total = hits.get("total", {})
        
        # Handle different Elasticsearch versions
        if isinstance(total, dict):
            total_count = total.get("value", 0)
        else:
            total_count = total
        
        results = []
        for hit in hits.get("hits", []):
            source = hit.get("_source", {})
            source["_score"] = hit.get("_score", 0)
            source["_id"] = hit.get("_id")
            results.append(source)
        
        # Process aggregations
        aggregations = {}
        if "aggregations" in response:
            for agg_name, agg_data in response["aggregations"].items():
                if "value" in agg_data:
                    aggregations[agg_name] = agg_data["value"]
                elif "buckets" in agg_data:
                    aggregations[agg_name] = [
                        {"key": bucket["key"], "count": bucket["doc_count"]}
                        for bucket in agg_data["buckets"]
                    ]
        
        return {
            "source": "elasticsearch",
            "total_results": total_count,
            "results": results,
            "aggregations": aggregations,
            "took": response.get("took", 0),
            "query_info": {
                "index": self.index_name,
                "query_type": "elasticsearch"
            }
        }
    
    async def get_mapping(self) -> Dict[str, Any]:
        """Get the mapping of the Elasticsearch index"""
        try:
            if not self.es:
                return {"error": "Elasticsearch not initialized"}
            
            response = await self.es.indices.get_mapping(index=self.index_name)
            return response.get(self.index_name, {}).get("mappings", {})
            
        except Exception as e:
            print(f"Error getting Elasticsearch mapping: {e}")
            return {"error": str(e)}
    
    async def health_check(self) -> bool:
        """Check if Elasticsearch is healthy"""
        try:
            if not self.es:
                return False
            
            health = await self.es.cluster.health()
            return health.get("status") in ["green", "yellow"]
            
        except Exception as e:
            print(f"Elasticsearch health check failed: {e}")
            return False
    
    async def close(self):
        """Close Elasticsearch connection"""
        if self.es:
            await self.es.close()