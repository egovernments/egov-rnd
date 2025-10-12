from flask import Flask, jsonify, request
from flask_cors import CORS
from main import (
    get_llm,
    write_PostgreSQL_query,
    run_query,
    write_elasticsearch_query,
    run_elasticsearch_query,
    get_elasticsearch_indices,
    select_best_elasticsearch_index,
    es
)
import json

app = Flask(__name__)
CORS(app)

# Initialize LLM
llm = get_llm(load_from_hugging_face=False)

def parse_postgres_result(query_result):
    """Parse PostgreSQL query result into structured format"""
    try:
        lines = query_result.strip().split('\n')
        if len(lines) < 2:
            return {"columns": [], "rows": []}

        # Extract headers
        headers = [col.strip() for col in lines[0].split('|')]

        # Extract data rows
        data_rows = []
        for line in lines[1:]:
            if line.strip() and '|' in line:
                row = [cell.strip() for cell in line.split('|')]
                if len(row) == len(headers):
                    data_rows.append(row)

        return {"columns": headers, "rows": data_rows}
    except Exception as e:
        print(f"Error parsing PostgreSQL result: {e}")
        return {"columns": [], "rows": [], "error": str(e)}

def parse_elasticsearch_result(es_response):
    """Parse Elasticsearch response into structured format"""
    try:
        if "error" in es_response:
            return {"columns": [], "rows": [], "error": es_response["error"]}

        hits = es_response.get('hits', {}).get('hits', [])
        if not hits:
            return {"columns": [], "rows": [], "message": "No results found"}

        # Extract all unique keys from all documents
        all_keys = set()
        for hit in hits:
            source = hit.get('_source', {})
            all_keys.update(source.keys())

        columns = sorted(list(all_keys))

        # Build rows
        rows = []
        for hit in hits:
            source = hit.get('_source', {})
            row = [str(source.get(col, '')) for col in columns]
            rows.append(row)

        return {"columns": columns, "rows": rows}
    except Exception as e:
        print(f"Error parsing Elasticsearch result: {e}")
        return {"columns": [], "rows": [], "error": str(e)}

@app.route('/api/health', methods=['GET'])
def health():
    """Health check endpoint"""
    return jsonify({"status": "healthy", "message": "Backend API is running"})

@app.route('/api/query/postgresql', methods=['POST'])
def query_postgresql():
    """Execute PostgreSQL query"""
    try:
        data = request.json
        natural_query = data.get('query', '')

        if not natural_query:
            return jsonify({"error": "Query parameter is required"}), 400

        # Generate SQL query from natural language
        query_generator = write_PostgreSQL_query(llm)
        sql_query = query_generator.invoke({"question": natural_query})

        # Execute query
        result = run_query(sql_query)

        # Parse result
        parsed_result = parse_postgres_result(result)

        return jsonify({
            "success": True,
            "data_source": "postgresql",
            "sql_query": sql_query,
            "natural_query": natural_query,
            **parsed_result
        })

    except Exception as e:
        return jsonify({"success": False, "error": str(e)}), 500

@app.route('/api/query/elasticsearch', methods=['POST'])
def query_elasticsearch():
    """Execute Elasticsearch query"""
    try:
        data = request.json
        natural_query = data.get('query', '')
        index_name = data.get('index_name', None)

        if not natural_query:
            return jsonify({"error": "Query parameter is required"}), 400

        # Auto-select index if not provided
        if not index_name:
            index_name = select_best_elasticsearch_index(natural_query, llm)
            if not index_name:
                return jsonify({"error": "No Elasticsearch indices found"}), 404

        # Generate Elasticsearch query
        query_generator = write_elasticsearch_query(llm, index_name)
        es_query_json = query_generator.invoke({"question": natural_query})

        # Execute query
        es_response = run_elasticsearch_query(index_name, es_query_json)

        # Parse result
        parsed_result = parse_elasticsearch_result(es_response)

        return jsonify({
            "success": True,
            "data_source": "elasticsearch",
            "index_name": index_name,
            "es_query": es_query_json,
            "natural_query": natural_query,
            **parsed_result
        })

    except Exception as e:
        return jsonify({"success": False, "error": str(e)}), 500

@app.route('/api/indices', methods=['GET'])
def get_indices():
    """Get list of available Elasticsearch indices"""
    try:
        indices = get_elasticsearch_indices()
        return jsonify({
            "success": True,
            "indices": indices
        })
    except Exception as e:
        return jsonify({"success": False, "error": str(e)}), 500

@app.route('/api/query', methods=['POST'])
def unified_query():
    """Unified query endpoint for both PostgreSQL and Elasticsearch"""
    try:
        data = request.json
        natural_query = data.get('query', '')
        data_source = data.get('data_source', 'postgresql').lower()

        if not natural_query:
            return jsonify({"error": "Query parameter is required"}), 400

        if data_source == 'elasticsearch':
            return query_elasticsearch()
        else:
            return query_postgresql()

    except Exception as e:
        return jsonify({"success": False, "error": str(e)}), 500

@app.route('/api/schema', methods=['GET'])
def get_schema():
    """Get PostgreSQL database schema"""
    try:
        from main import get_schema as get_db_schema
        schema = get_db_schema('')
        return jsonify({
            "success": True,
            "schema": schema
        })
    except Exception as e:
        return jsonify({"success": False, "error": str(e)}), 500

@app.route('/api/test/query', methods=['POST'])
def test_direct_query():
    """Test direct SQL or Elasticsearch query (for debugging)"""
    try:
        data = request.json
        query = data.get('query', '')
        data_source = data.get('data_source', 'postgresql').lower()

        if not query:
            return jsonify({"error": "Query parameter is required"}), 400

        if data_source == 'postgresql':
            result = run_query(query)
            parsed_result = parse_postgres_result(result)
            return jsonify({
                "success": True,
                "data_source": "postgresql",
                "query": query,
                "raw_result": result,
                **parsed_result
            })
        else:
            return jsonify({"error": "Only PostgreSQL direct queries supported"}), 400

    except Exception as e:
        return jsonify({"success": False, "error": str(e)}), 500

if __name__ == '__main__':
    print("Starting Flask backend API on http://localhost:5000")
    print("Available endpoints:")
    print("  - GET  /api/health")
    print("  - POST /api/query/postgresql")
    print("  - POST /api/query/elasticsearch")
    print("  - POST /api/query (unified)")
    print("  - GET  /api/indices")
    print("  - GET  /api/schema")
    print("  - POST /api/test/query")
    app.run(debug=True, port=5000)
