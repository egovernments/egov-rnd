from typing import Dict, List, Any, Tuple
import re
from datetime import datetime

class QueryRouter:
    def __init__(self):
        self.elasticsearch_indicators = {
            "keywords": ["search", "find", "text", "document", "content", "title", "author", "tag"],
            "operations": ["full-text", "fuzzy", "match", "similarity", "relevance", "score"],
            "data_types": ["documents", "articles", "posts", "content", "text data"]
        }
        
        self.postgresql_indicators = {
            "keywords": ["user", "employee", "product", "order", "customer", "count", "sum", "average"],
            "operations": ["aggregate", "group", "join", "calculate", "total", "statistics"],
            "data_types": ["structured", "relational", "tabular", "records", "rows"]
        }
        
        self.intent_routing = {
            "search_data": {"es": 0.8, "pg": 0.3},
            "count_records": {"es": 0.4, "pg": 0.9},
            "aggregate_data": {"es": 0.2, "pg": 0.95},
            "filter_data": {"es": 0.7, "pg": 0.8},
            "time_analysis": {"es": 0.6, "pg": 0.8},
            "compare_data": {"es": 0.5, "pg": 0.7},
            "get_schema": {"es": 0.3, "pg": 0.9},
            "trend_analysis": {"es": 0.6, "pg": 0.9},
            "statistical_analysis": {"es": 0.3, "pg": 0.95}
        }
    
    async def route_query(self, nlp_result: Dict[str, Any]) -> Dict[str, Any]:
        """
        Route query to appropriate data sources based on NLP analysis
        Returns routing decisions and optimized queries for each source
        """
        routing_decision = {
            "use_elasticsearch": False,
            "use_postgresql": False,
            "primary_source": None,
            "confidence_scores": {},
            "elasticsearch_query": None,
            "postgresql_query": None,
            "reasoning": []
        }
        
        # Calculate confidence scores for each source
        es_score = self._calculate_elasticsearch_score(nlp_result)
        pg_score = self._calculate_postgresql_score(nlp_result)
        
        routing_decision["confidence_scores"] = {
            "elasticsearch": es_score,
            "postgresql": pg_score
        }
        
        # Determine which sources to use
        threshold = 0.4
        
        if es_score >= threshold:
            routing_decision["use_elasticsearch"] = True
            routing_decision["elasticsearch_query"] = self._build_elasticsearch_query(nlp_result)
            routing_decision["reasoning"].append(f"Elasticsearch selected (score: {es_score:.2f})")
        
        if pg_score >= threshold:
            routing_decision["use_postgresql"] = True
            routing_decision["postgresql_query"] = self._build_postgresql_query(nlp_result)
            routing_decision["reasoning"].append(f"PostgreSQL selected (score: {pg_score:.2f})")
        
        # Determine primary source
        if es_score > pg_score:
            routing_decision["primary_source"] = "elasticsearch"
        else:
            routing_decision["primary_source"] = "postgresql"
        
        # If both scores are low, default to both sources
        if es_score < threshold and pg_score < threshold:
            routing_decision["use_elasticsearch"] = True
            routing_decision["use_postgresql"] = True
            routing_decision["elasticsearch_query"] = self._build_elasticsearch_query(nlp_result)
            routing_decision["postgresql_query"] = self._build_postgresql_query(nlp_result)
            routing_decision["reasoning"].append("Low confidence scores - querying both sources")
        
        return routing_decision
    
    def _calculate_elasticsearch_score(self, nlp_result: Dict[str, Any]) -> float:
        """Calculate confidence score for Elasticsearch"""
        score = 0.0
        query = nlp_result.get("original_query", "").lower()
        intent = nlp_result.get("intent", "")
        entities = nlp_result.get("entities", [])
        
        # Base score from intent
        if intent in self.intent_routing:
            score += self.intent_routing[intent].get("es", 0) * 0.4
        
        # Score from keywords
        keyword_score = 0
        for keyword in self.elasticsearch_indicators["keywords"]:
            if keyword in query:
                keyword_score += 0.1
        score += min(keyword_score, 0.3)
        
        # Score from operations
        operation_score = 0
        for operation in self.elasticsearch_indicators["operations"]:
            if operation in query:
                operation_score += 0.15
        score += min(operation_score, 0.2)
        
        # Score from entities
        entity_score = 0
        for entity in entities:
            entity_text = entity.get("text", "").lower()
            entity_label = entity.get("label", "")
            
            # Text-based entities favor Elasticsearch
            if entity_label in ["PERSON", "ORG", "GPE", "WORK_OF_ART"]:
                entity_score += 0.05
            elif any(text_keyword in entity_text for text_keyword in ["document", "article", "content"]):
                entity_score += 0.1
        
        score += min(entity_score, 0.1)
        
        # Check for text search patterns
        text_patterns = [r"search for", r"find.*containing", r"documents about", r"articles on"]
        for pattern in text_patterns:
            if re.search(pattern, query):
                score += 0.1
                break
        
        return min(score, 1.0)
    
    def _calculate_postgresql_score(self, nlp_result: Dict[str, Any]) -> float:
        """Calculate confidence score for PostgreSQL"""
        score = 0.0
        query = nlp_result.get("original_query", "").lower()
        intent = nlp_result.get("intent", "")
        entities = nlp_result.get("entities", [])
        aggregations = nlp_result.get("aggregations", [])
        filters = nlp_result.get("filters", [])
        
        # Base score from intent
        if intent in self.intent_routing:
            score += self.intent_routing[intent].get("pg", 0) * 0.4
        
        # Score from keywords
        keyword_score = 0
        for keyword in self.postgresql_indicators["keywords"]:
            if keyword in query:
                keyword_score += 0.1
        score += min(keyword_score, 0.3)
        
        # Score from operations
        operation_score = 0
        for operation in self.postgresql_indicators["operations"]:
            if operation in query:
                operation_score += 0.15
        score += min(operation_score, 0.2)
        
        # Heavy bonus for aggregations
        if aggregations:
            score += 0.3
        
        # Bonus for filters
        if filters:
            score += 0.1
        
        # Score from entities
        entity_score = 0
        for entity in entities:
            entity_text = entity.get("text", "").lower()
            entity_label = entity.get("label", "")
            
            # Structured data entities favor PostgreSQL
            if entity_label in ["MONEY", "PERCENT", "QUANTITY", "CARDINAL"]:
                entity_score += 0.05
            elif any(struct_keyword in entity_text for struct_keyword in ["user", "product", "order", "customer"]):
                entity_score += 0.1
        
        score += min(entity_score, 0.1)
        
        # Check for SQL-like patterns
        sql_patterns = [r"how many", r"count.*", r"sum of", r"average.*", r"group by", r"total.*"]
        for pattern in sql_patterns:
            if re.search(pattern, query):
                score += 0.15
                break
        
        return min(score, 1.0)
    
    def _build_elasticsearch_query(self, nlp_result: Dict[str, Any]) -> Dict[str, Any]:
        """Build optimized query parameters for Elasticsearch"""
        query_params = {
            "search_text": self._extract_search_text(nlp_result),
            "filters": nlp_result.get("filters", []),
            "aggregations": self._adapt_aggregations_for_es(nlp_result.get("aggregations", [])),
            "temporal_info": nlp_result.get("temporal_info", {}),
            "limit": self._determine_limit(nlp_result),
            "sort_field": "_score",
            "sort_order": "desc"
        }
        
        # Optimize for specific intents
        intent = nlp_result.get("intent", "")
        if intent == "count_records":
            query_params["limit"] = 0  # Just get count
            query_params["aggregations"].append({"type": "count", "field": "_id"})
        elif intent == "time_analysis":
            query_params["sort_field"] = "created_at"
            query_params["aggregations"].append({"type": "group_by", "field": "created_at"})
        
        return query_params
    
    def _build_postgresql_query(self, nlp_result: Dict[str, Any]) -> Dict[str, Any]:
        """Build optimized query parameters for PostgreSQL"""
        query_params = {
            "intent": nlp_result.get("intent", ""),
            "entities": nlp_result.get("entities", []),
            "filters": nlp_result.get("filters", []),
            "aggregations": self._adapt_aggregations_for_pg(nlp_result.get("aggregations", [])),
            "temporal_info": nlp_result.get("temporal_info", {}),
            "limit": self._determine_limit(nlp_result),
            "sort_field": None,
            "sort_order": "DESC",
            "original_query": nlp_result.get("original_query", "")
        }
        
        # Optimize for specific intents
        intent = nlp_result.get("intent", "")
        if intent == "aggregate_data":
            query_params["limit"] = 100  # Reasonable limit for aggregations
        elif intent == "count_records":
            query_params["aggregations"].append({"type": "count", "field": "*"})
        
        return query_params
    
    def _extract_search_text(self, nlp_result: Dict[str, Any]) -> str:
        """Extract the main search text for Elasticsearch"""
        original_query = nlp_result.get("original_query", "")
        processed_query = nlp_result.get("processed_query", "")
        
        # Remove command words and keep the essence
        stopwords = ["find", "search", "get", "show", "list", "how many", "count", "total"]
        words = processed_query.split()
        
        # Filter out stopwords but keep important terms
        filtered_words = []
        for word in words:
            if word not in stopwords and len(word) > 2:
                filtered_words.append(word)
        
        search_text = " ".join(filtered_words)
        
        # If search text is too short, use original query
        if len(search_text.strip()) < 3:
            search_text = original_query
        
        return search_text
    
    def _adapt_aggregations_for_es(self, aggregations: List[Dict[str, Any]]) -> List[Dict[str, Any]]:
        """Adapt aggregations for Elasticsearch"""
        es_aggregations = []
        
        for agg in aggregations:
            agg_type = agg.get("type")
            field = agg.get("field")
            
            # Map aggregation types to Elasticsearch equivalents
            if agg_type in ["count", "sum", "avg", "max", "min"]:
                es_aggregations.append(agg)
            elif agg_type == "group_by":
                # Convert to terms aggregation
                es_aggregations.append({
                    "type": "group_by",
                    "field": f"{field}.keyword" if field else "category.keyword"
                })
        
        return es_aggregations
    
    def _adapt_aggregations_for_pg(self, aggregations: List[Dict[str, Any]]) -> List[Dict[str, Any]]:
        """Adapt aggregations for PostgreSQL"""
        # PostgreSQL can handle all aggregation types natively
        return aggregations
    
    def _determine_limit(self, nlp_result: Dict[str, Any]) -> int:
        """Determine appropriate result limit based on query intent"""
        intent = nlp_result.get("intent", "")
        
        intent_limits = {
            "count_records": 0,  # No need for actual records
            "aggregate_data": 100,
            "search_data": 50,
            "filter_data": 100,
            "time_analysis": 200,
            "compare_data": 100
        }
        
        return intent_limits.get(intent, 50)
    
    def _extract_entity_value(self, entities: List[Dict[str, Any]], entity_type: str) -> str:
        """Extract specific entity value by type"""
        for entity in entities:
            if entity.get("label") == entity_type:
                return entity.get("text", "")
        return ""