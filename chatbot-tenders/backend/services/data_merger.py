from typing import Dict, List, Any, Optional
from datetime import datetime
import json

class DataMerger:
    def __init__(self):
        self.merge_strategies = {
            "search_data": self._merge_search_results,
            "count_records": self._merge_count_results,
            "aggregate_data": self._merge_aggregate_results,
            "filter_data": self._merge_filter_results,
            "time_analysis": self._merge_time_analysis,
            "compare_data": self._merge_comparison_results
        }
    
    async def merge_results(self, results: Dict[str, Any], nlp_result: Dict[str, Any]) -> Dict[str, Any]:
        """
        Merge results from multiple data sources into a unified response
        """
        intent = nlp_result.get("intent", "search_data")
        
        # Get the appropriate merge strategy
        merge_function = self.merge_strategies.get(intent, self._merge_search_results)
        
        # Merge the results
        merged_data = merge_function(results, nlp_result)
        
        # Add metadata
        merged_data["metadata"] = self._create_metadata(results, nlp_result)
        
        # Generate summary
        merged_data["summary"] = self._generate_summary(merged_data, nlp_result)
        
        return merged_data
    
    def _merge_search_results(self, results: Dict[str, Any], nlp_result: Dict[str, Any]) -> Dict[str, Any]:
        """Merge search results from both sources"""
        merged = {
            "type": "search_results",
            "total_results": 0,
            "results": [],
            "sources": [],
            "aggregations": {}
        }
        
        # Combine results from Elasticsearch
        if "elasticsearch" in results:
            es_data = results["elasticsearch"]
            merged["total_results"] += es_data.get("total_results", 0)
            merged["sources"].append("elasticsearch")
            
            # Add ES results with source metadata
            for result in es_data.get("results", []):
                result["_source"] = "elasticsearch"
                result["_relevance_score"] = result.get("_score", 0)
                merged["results"].append(result)
            
            # Merge aggregations
            if es_data.get("aggregations"):
                merged["aggregations"]["elasticsearch"] = es_data["aggregations"]
        
        # Combine results from PostgreSQL
        if "postgresql" in results:
            pg_data = results["postgresql"]
            merged["total_results"] += pg_data.get("total_results", 0)
            merged["sources"].append("postgresql")
            
            # Add PG results with source metadata
            for result in pg_data.get("results", []):
                result["_source"] = "postgresql"
                result["_relevance_score"] = self._calculate_pg_relevance(result, nlp_result)
                merged["results"].append(result)
            
            # Merge query info
            if pg_data.get("query_info"):
                merged["postgresql_query"] = pg_data["query_info"].get("sql_query")
        
        # Sort combined results by relevance if we have mixed sources
        if len(merged["sources"]) > 1:
            merged["results"] = sorted(
                merged["results"], 
                key=lambda x: x.get("_relevance_score", 0), 
                reverse=True
            )
        
        # Limit results to avoid overwhelming response
        max_results = 20
        if len(merged["results"]) > max_results:
            merged["results"] = merged["results"][:max_results]
            merged["truncated"] = True
            merged["total_shown"] = max_results
        else:
            merged["truncated"] = False
            merged["total_shown"] = len(merged["results"])
        
        return merged
    
    def _merge_count_results(self, results: Dict[str, Any], nlp_result: Dict[str, Any]) -> Dict[str, Any]:
        """Merge count results from both sources"""
        merged = {
            "type": "count_results",
            "total_count": 0,
            "breakdown": {},
            "sources": []
        }
        
        if "elasticsearch" in results:
            es_data = results["elasticsearch"]
            es_count = es_data.get("total_results", 0)
            merged["breakdown"]["elasticsearch"] = es_count
            merged["total_count"] += es_count
            merged["sources"].append("elasticsearch")
        
        if "postgresql" in results:
            pg_data = results["postgresql"]
            pg_count = pg_data.get("total_results", 0)
            
            # If we have aggregations, use those instead
            if pg_data.get("results") and len(pg_data["results"]) > 0:
                first_result = pg_data["results"][0]
                for key, value in first_result.items():
                    if key.startswith("count_"):
                        pg_count = value
                        break
            
            merged["breakdown"]["postgresql"] = pg_count
            merged["total_count"] += pg_count
            merged["sources"].append("postgresql")
        
        return merged
    
    def _merge_aggregate_results(self, results: Dict[str, Any], nlp_result: Dict[str, Any]) -> Dict[str, Any]:
        """Merge aggregation results from both sources"""
        merged = {
            "type": "aggregate_results",
            "aggregations": {},
            "sources": [],
            "details": []
        }
        
        if "elasticsearch" in results:
            es_data = results["elasticsearch"]
            if es_data.get("aggregations"):
                merged["aggregations"]["elasticsearch"] = es_data["aggregations"]
                merged["sources"].append("elasticsearch")
        
        if "postgresql" in results:
            pg_data = results["postgresql"]
            pg_aggregations = {}
            
            # Extract aggregations from PostgreSQL results
            for result in pg_data.get("results", []):
                for key, value in result.items():
                    if any(prefix in key for prefix in ["sum_", "avg_", "max_", "min_", "count_"]):
                        pg_aggregations[key] = value
            
            if pg_aggregations:
                merged["aggregations"]["postgresql"] = pg_aggregations
                merged["sources"].append("postgresql")
                merged["details"] = pg_data.get("results", [])
        
        return merged
    
    def _merge_filter_results(self, results: Dict[str, Any], nlp_result: Dict[str, Any]) -> Dict[str, Any]:
        """Merge filtered results from both sources"""
        # Use the same logic as search results but with filter-specific metadata
        merged = self._merge_search_results(results, nlp_result)
        merged["type"] = "filter_results"
        
        # Add filter information
        filters = nlp_result.get("filters", [])
        merged["applied_filters"] = filters
        
        return merged
    
    def _merge_time_analysis(self, results: Dict[str, Any], nlp_result: Dict[str, Any]) -> Dict[str, Any]:
        """Merge time-based analysis results"""
        merged = {
            "type": "time_analysis",
            "time_period": nlp_result.get("temporal_info", {}),
            "results_by_source": {},
            "timeline": [],
            "total_results": 0
        }
        
        if "elasticsearch" in results:
            es_data = results["elasticsearch"]
            merged["results_by_source"]["elasticsearch"] = {
                "count": es_data.get("total_results", 0),
                "results": es_data.get("results", [])
            }
            merged["total_results"] += es_data.get("total_results", 0)
        
        if "postgresql" in results:
            pg_data = results["postgresql"]
            merged["results_by_source"]["postgresql"] = {
                "count": pg_data.get("total_results", 0),
                "results": pg_data.get("results", [])
            }
            merged["total_results"] += pg_data.get("total_results", 0)
            
            # Create timeline from PostgreSQL data (assuming it has date fields)
            merged["timeline"] = self._create_timeline(pg_data.get("results", []))
        
        return merged
    
    def _merge_comparison_results(self, results: Dict[str, Any], nlp_result: Dict[str, Any]) -> Dict[str, Any]:
        """Merge comparison results from both sources"""
        merged = {
            "type": "comparison_results",
            "comparison_data": {},
            "sources": [],
            "metrics": {}
        }
        
        if "elasticsearch" in results:
            es_data = results["elasticsearch"]
            merged["comparison_data"]["elasticsearch"] = {
                "total_records": es_data.get("total_results", 0),
                "sample_data": es_data.get("results", [])[:5]  # Top 5 for comparison
            }
            merged["sources"].append("elasticsearch")
        
        if "postgresql" in results:
            pg_data = results["postgresql"]
            merged["comparison_data"]["postgresql"] = {
                "total_records": pg_data.get("total_results", 0),
                "sample_data": pg_data.get("results", [])[:5]  # Top 5 for comparison
            }
            merged["sources"].append("postgresql")
        
        # Calculate comparison metrics
        merged["metrics"] = self._calculate_comparison_metrics(merged["comparison_data"])
        
        return merged
    
    def _calculate_pg_relevance(self, result: Dict[str, Any], nlp_result: Dict[str, Any]) -> float:
        """Calculate relevance score for PostgreSQL results"""
        score = 0.5  # Base score
        
        original_query = nlp_result.get("original_query", "").lower()
        
        # Check if any field values match query terms
        query_terms = original_query.split()
        
        for key, value in result.items():
            if isinstance(value, str):
                value_lower = value.lower()
                for term in query_terms:
                    if term in value_lower:
                        score += 0.1
        
        # Boost score for recent records
        date_fields = ["created_at", "updated_at", "order_date", "hire_date"]
        for field in date_fields:
            if field in result and result[field]:
                try:
                    if isinstance(result[field], str):
                        date_val = datetime.fromisoformat(result[field].replace('Z', '+00:00'))
                    else:
                        date_val = result[field]
                    
                    days_old = (datetime.now() - date_val.replace(tzinfo=None)).days
                    if days_old < 30:  # Recent records get boost
                        score += 0.2
                    elif days_old < 90:
                        score += 0.1
                except:
                    pass
        
        return min(score, 1.0)
    
    def _create_timeline(self, results: List[Dict[str, Any]]) -> List[Dict[str, Any]]:
        """Create timeline data from results"""
        timeline = []
        
        # Group results by date
        date_groups = {}
        
        for result in results:
            date_fields = ["created_at", "updated_at", "order_date", "hire_date"]
            
            for field in date_fields:
                if field in result and result[field]:
                    try:
                        if isinstance(result[field], str):
                            date_val = datetime.fromisoformat(result[field].replace('Z', '+00:00'))
                        else:
                            date_val = result[field]
                        
                        date_key = date_val.date().isoformat()
                        
                        if date_key not in date_groups:
                            date_groups[date_key] = []
                        
                        date_groups[date_key].append(result)
                        break
                    except:
                        continue
        
        # Convert to timeline format
        for date_key, items in sorted(date_groups.items()):
            timeline.append({
                "date": date_key,
                "count": len(items),
                "items": items[:3]  # Sample items
            })
        
        return timeline
    
    def _calculate_comparison_metrics(self, comparison_data: Dict[str, Any]) -> Dict[str, Any]:
        """Calculate metrics for comparison results"""
        metrics = {}
        
        if "elasticsearch" in comparison_data and "postgresql" in comparison_data:
            es_count = comparison_data["elasticsearch"]["total_records"]
            pg_count = comparison_data["postgresql"]["total_records"]
            
            metrics["total_records"] = {
                "elasticsearch": es_count,
                "postgresql": pg_count,
                "difference": abs(es_count - pg_count),
                "ratio": es_count / pg_count if pg_count > 0 else float('inf')
            }
        
        return metrics
    
    def _create_metadata(self, results: Dict[str, Any], nlp_result: Dict[str, Any]) -> Dict[str, Any]:
        """Create metadata for the merged results"""
        metadata = {
            "query_info": {
                "original_query": nlp_result.get("original_query"),
                "intent": nlp_result.get("intent"),
                "entities_found": len(nlp_result.get("entities", [])),
                "filters_applied": len(nlp_result.get("filters", [])),
                "aggregations_requested": len(nlp_result.get("aggregations", []))
            },
            "sources_queried": list(results.keys()),
            "processing_time": datetime.now().isoformat(),
            "result_counts": {}
        }
        
        for source, data in results.items():
            metadata["result_counts"][source] = data.get("total_results", 0)
        
        return metadata
    
    def _generate_summary(self, merged_data: Dict[str, Any], nlp_result: Dict[str, Any]) -> str:
        """Generate a human-readable summary of the results"""
        result_type = merged_data.get("type", "unknown")
        sources = merged_data.get("sources", [])
        
        if result_type == "search_results":
            total = merged_data.get("total_results", 0)
            shown = merged_data.get("total_shown", 0)
            
            summary = f"Found {total} total results"
            if len(sources) > 1:
                summary += f" across {len(sources)} data sources"
            if shown < total:
                summary += f", showing top {shown}"
                
        elif result_type == "count_results":
            total = merged_data.get("total_count", 0)
            breakdown = merged_data.get("breakdown", {})
            
            summary = f"Total count: {total}"
            if len(breakdown) > 1:
                details = [f"{source}: {count}" for source, count in breakdown.items()]
                summary += f" ({', '.join(details)})"
                
        elif result_type == "aggregate_results":
            aggregations = merged_data.get("aggregations", {})
            summary = f"Aggregation results from {len(aggregations)} source(s)"
            
        elif result_type == "time_analysis":
            total = merged_data.get("total_results", 0)
            time_period = merged_data.get("time_period", {})
            
            summary = f"Time analysis: {total} records"
            if time_period.get("time_expressions"):
                summary += f" for {', '.join(time_period['time_expressions'])}"
                
        else:
            summary = "Query processed successfully"
        
        return summary