import spacy
import nltk
from transformers import AutoTokenizer, AutoModelForSequenceClassification, pipeline
import re
import json
from typing import Dict, List, Any, Optional
import asyncio
from datetime import datetime

class NLPProcessor:
    def __init__(self):
        self.nlp = None
        self.intent_classifier = None
        self.entity_extractor = None
        self.text_generator = None
        self.query_patterns = {
            "count": ["how many", "count", "number of", "total"],
            "find": ["find", "search", "get", "show", "list"],
            "filter": ["where", "with", "having", "filter"],
            "aggregate": ["average", "sum", "max", "min", "group"],
            "time_based": ["today", "yesterday", "last week", "this month", "recent"],
            "comparison": ["greater", "less", "between", "compare", "vs"],
        }
        
    async def initialize(self):
        """Initialize NLP models and download required data"""
        try:
            # Download required NLTK data
            nltk.download('punkt', quiet=True)
            nltk.download('stopwords', quiet=True)
            nltk.download('wordnet', quiet=True)
            
            # Load spaCy model
            try:
                self.nlp = spacy.load("en_core_web_sm")
            except OSError:
                print("Downloading spaCy model...")
                spacy.cli.download("en_core_web_sm")
                self.nlp = spacy.load("en_core_web_sm")
            
            # Initialize Hugging Face models for advanced NLP
            self.text_generator = pipeline(
                "text-generation",
                model="microsoft/DialoGPT-medium",
                device=-1  # CPU mode for compatibility
            )
            
            # Intent classification using BERT
            self.intent_classifier = pipeline(
                "zero-shot-classification",
                model="facebook/bart-large-mnli",
                device=-1
            )
            
            print("NLP models initialized successfully!")
            
        except Exception as e:
            print(f"Error initializing NLP models: {e}")
            # Fallback to basic processing
            self.nlp = None
    
    async def process_query(self, query: str) -> Dict[str, Any]:
        """Process natural language query and extract intent, entities, and structure"""
        result = {
            "original_query": query,
            "processed_query": self._preprocess_query(query),
            "intent": await self._classify_intent(query),
            "entities": await self._extract_entities(query),
            "query_type": self._determine_query_type(query),
            "temporal_info": self._extract_temporal_info(query),
            "filters": self._extract_filters(query),
            "aggregations": self._extract_aggregations(query)
        }
        
        return result
    
    def _preprocess_query(self, query: str) -> str:
        """Clean and preprocess the query"""
        # Remove extra whitespace and convert to lowercase
        query = re.sub(r'\s+', ' ', query.strip().lower())
        
        # Handle common abbreviations
        replacements = {
            "what's": "what is",
            "how's": "how is",
            "where's": "where is",
            "when's": "when is",
            "who's": "who is",
            "it's": "it is",
            "don't": "do not",
            "won't": "will not",
            "can't": "cannot"
        }
        
        for abbr, full in replacements.items():
            query = query.replace(abbr, full)
            
        return query
    
    async def _classify_intent(self, query: str) -> str:
        """Classify the intent of the query using generative AI"""
        try:
            if self.intent_classifier:
                candidate_labels = [
                    "search_data", "count_records", "aggregate_data", 
                    "filter_data", "compare_data", "get_schema",
                    "time_analysis", "trend_analysis", "statistical_analysis"
                ]
                
                result = self.intent_classifier(query, candidate_labels)
                return result['labels'][0]
            else:
                return self._fallback_intent_classification(query)
                
        except Exception as e:
            print(f"Error in intent classification: {e}")
            return self._fallback_intent_classification(query)
    
    def _fallback_intent_classification(self, query: str) -> str:
        """Fallback intent classification using pattern matching"""
        query_lower = query.lower()
        
        if any(word in query_lower for word in self.query_patterns["count"]):
            return "count_records"
        elif any(word in query_lower for word in self.query_patterns["aggregate"]):
            return "aggregate_data"
        elif any(word in query_lower for word in self.query_patterns["time_based"]):
            return "time_analysis"
        elif any(word in query_lower for word in self.query_patterns["comparison"]):
            return "compare_data"
        elif any(word in query_lower for word in self.query_patterns["filter"]):
            return "filter_data"
        else:
            return "search_data"
    
    async def _extract_entities(self, query: str) -> List[Dict[str, Any]]:
        """Extract named entities from the query"""
        entities = []
        
        try:
            if self.nlp:
                doc = self.nlp(query)
                for ent in doc.ents:
                    entities.append({
                        "text": ent.text,
                        "label": ent.label_,
                        "description": spacy.explain(ent.label_),
                        "start": ent.start_char,
                        "end": ent.end_char
                    })
            
            # Add custom entity extraction for database-specific terms
            entities.extend(self._extract_custom_entities(query))
            
        except Exception as e:
            print(f"Error in entity extraction: {e}")
            entities = self._extract_custom_entities(query)
            
        return entities
    
    def _extract_custom_entities(self, query: str) -> List[Dict[str, Any]]:
        """Extract custom entities relevant to database queries"""
        entities = []
        query_lower = query.lower()
        
        # Extract table/index names (common patterns)
        table_patterns = [
            r'\bfrom\s+(\w+)',
            r'\btable\s+(\w+)',
            r'\bindex\s+(\w+)',
            r'\bin\s+(\w+)\s+(?:table|index)'
        ]
        
        for pattern in table_patterns:
            matches = re.finditer(pattern, query_lower)
            for match in matches:
                entities.append({
                    "text": match.group(1),
                    "label": "TABLE_NAME",
                    "description": "Database table or index name",
                    "start": match.start(1),
                    "end": match.end(1)
                })
        
        # Extract field names
        field_patterns = [
            r'\bfield\s+(\w+)',
            r'\bcolumn\s+(\w+)',
            r'\b(\w+)\s+(?:field|column)',
            r'\bby\s+(\w+)'
        ]
        
        for pattern in field_patterns:
            matches = re.finditer(pattern, query_lower)
            for match in matches:
                entities.append({
                    "text": match.group(1),
                    "label": "FIELD_NAME",
                    "description": "Database field or column name",
                    "start": match.start(1),
                    "end": match.end(1)
                })
        
        return entities
    
    def _determine_query_type(self, query: str) -> str:
        """Determine the type of database query needed"""
        query_lower = query.lower()
        
        if "elasticsearch" in query_lower or "search" in query_lower:
            return "elasticsearch_focused"
        elif "postgresql" in query_lower or "sql" in query_lower:
            return "postgresql_focused"
        else:
            return "both_sources"
    
    def _extract_temporal_info(self, query: str) -> Dict[str, Any]:
        """Extract temporal information from the query"""
        temporal_info = {
            "has_time_constraint": False,
            "time_expressions": [],
            "relative_time": None
        }
        
        time_patterns = {
            "today": {"days": 0},
            "yesterday": {"days": -1},
            "last week": {"days": -7},
            "this week": {"days": 0, "week_start": True},
            "last month": {"months": -1},
            "this month": {"months": 0, "month_start": True},
            "last year": {"years": -1},
            "recent": {"days": -30}
        }
        
        query_lower = query.lower()
        for pattern, time_info in time_patterns.items():
            if pattern in query_lower:
                temporal_info["has_time_constraint"] = True
                temporal_info["time_expressions"].append(pattern)
                temporal_info["relative_time"] = time_info
                break
        
        # Extract specific dates using regex
        date_patterns = [
            r'\b\d{4}-\d{2}-\d{2}\b',  # YYYY-MM-DD
            r'\b\d{2}/\d{2}/\d{4}\b',  # MM/DD/YYYY
            r'\b\d{1,2}/\d{1,2}/\d{2,4}\b'  # M/D/YY or MM/DD/YYYY
        ]
        
        for pattern in date_patterns:
            matches = re.findall(pattern, query)
            if matches:
                temporal_info["has_time_constraint"] = True
                temporal_info["specific_dates"] = matches
        
        return temporal_info
    
    def _extract_filters(self, query: str) -> List[Dict[str, Any]]:
        """Extract filter conditions from the query"""
        filters = []
        
        # Common filter patterns
        filter_patterns = [
            (r'where\s+(\w+)\s*(=|>|<|>=|<=|!=)\s*([^\s]+)', 'condition'),
            (r'(\w+)\s+is\s+(not\s+)?(\w+)', 'is_condition'),
            (r'(\w+)\s+contains?\s+["\']([^"\']+)["\']', 'contains'),
            (r'(\w+)\s+between\s+(\d+)\s+and\s+(\d+)', 'range'),
        ]
        
        query_lower = query.lower()
        for pattern, filter_type in filter_patterns:
            matches = re.finditer(pattern, query_lower)
            for match in matches:
                if filter_type == 'condition':
                    filters.append({
                        "field": match.group(1),
                        "operator": match.group(2),
                        "value": match.group(3),
                        "type": "comparison"
                    })
                elif filter_type == 'is_condition':
                    filters.append({
                        "field": match.group(1),
                        "operator": "is_not" if match.group(2) else "is",
                        "value": match.group(3),
                        "type": "equality"
                    })
                elif filter_type == 'contains':
                    filters.append({
                        "field": match.group(1),
                        "operator": "contains",
                        "value": match.group(2),
                        "type": "text_search"
                    })
                elif filter_type == 'range':
                    filters.append({
                        "field": match.group(1),
                        "operator": "between",
                        "value": [match.group(2), match.group(3)],
                        "type": "range"
                    })
        
        return filters
    
    def _extract_aggregations(self, query: str) -> List[Dict[str, Any]]:
        """Extract aggregation requirements from the query"""
        aggregations = []
        query_lower = query.lower()
        
        agg_patterns = {
            r'count\s+(?:of\s+)?(\w+)': 'count',
            r'sum\s+(?:of\s+)?(\w+)': 'sum',
            r'average\s+(?:of\s+)?(\w+)': 'avg',
            r'avg\s+(?:of\s+)?(\w+)': 'avg',
            r'max\s+(?:of\s+)?(\w+)': 'max',
            r'min\s+(?:of\s+)?(\w+)': 'min',
            r'group\s+by\s+(\w+)': 'group_by'
        }
        
        for pattern, agg_type in agg_patterns.items():
            matches = re.finditer(pattern, query_lower)
            for match in matches:
                aggregations.append({
                    "type": agg_type,
                    "field": match.group(1),
                    "expression": match.group(0)
                })
        
        return aggregations
    
    async def generate_response(self, original_query: str, data: Dict[str, Any], nlp_result: Dict[str, Any]) -> str:
        """Generate a natural language response using generative AI"""
        try:
            # Prepare context for response generation
            context = self._prepare_response_context(original_query, data, nlp_result)
            
            if self.text_generator:
                # Use generative AI for sophisticated responses
                prompt = f"User asked: '{original_query}'. Based on the data analysis, provide a clear and helpful response: {context}"
                
                response = self.text_generator(
                    prompt,
                    max_length=200,
                    num_return_sequences=1,
                    temperature=0.7,
                    do_sample=True,
                    pad_token_id=50256
                )
                
                generated_text = response[0]['generated_text']
                # Extract only the response part
                response_text = generated_text.split("provide a clear and helpful response:")[-1].strip()
                
                if len(response_text) > 10:  # Valid response
                    return response_text
            
            # Fallback to template-based response
            return self._generate_template_response(original_query, data, nlp_result)
            
        except Exception as e:
            print(f"Error in response generation: {e}")
            return self._generate_template_response(original_query, data, nlp_result)
    
    def _prepare_response_context(self, query: str, data: Dict[str, Any], nlp_result: Dict[str, Any]) -> str:
        """Prepare context for response generation"""
        context_parts = []
        
        if data.get("total_results"):
            context_parts.append(f"Found {data['total_results']} results")
        
        if nlp_result.get("intent"):
            context_parts.append(f"Intent: {nlp_result['intent']}")
        
        if data.get("summary"):
            context_parts.append(f"Summary: {data['summary']}")
        
        return ". ".join(context_parts)
    
    def _generate_template_response(self, query: str, data: Dict[str, Any], nlp_result: Dict[str, Any]) -> str:
        """Generate response using templates"""
        intent = nlp_result.get("intent", "search_data")
        total_results = data.get("total_results", 0)
        
        if intent == "count_records":
            return f"I found {total_results} records matching your query."
        elif intent == "aggregate_data":
            if data.get("aggregations"):
                agg_text = ", ".join([f"{k}: {v}" for k, v in data["aggregations"].items()])
                return f"Here are the aggregated results: {agg_text}"
            else:
                return f"I've processed your aggregation request and found {total_results} relevant records."
        elif intent == "time_analysis":
            return f"Based on the time-based analysis, I found {total_results} records in the specified time period."
        elif intent == "compare_data":
            return f"I've compared the data as requested and found {total_results} relevant records for comparison."
        else:
            if total_results == 0:
                return "I couldn't find any records matching your query. Try rephrasing or being more specific."
            elif total_results == 1:
                return "I found exactly one record matching your query."
            else:
                return f"I found {total_results} records matching your query. Here are the results."