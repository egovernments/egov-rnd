from langchain_core.prompts import ChatPromptTemplate
from langchain_community.utilities import SQLDatabase
from langchain_core.output_parsers import StrOutputParser
from langchain_core.runnables import RunnablePassthrough
from langchain_openai import ChatOpenAI
from dotenv import load_dotenv
import pandas as pd
from tabulate import tabulate
import json
from elasticsearch import Elasticsearch
from elasticsearch_dsl import Search, Q

from langchain_huggingface import ChatHuggingFace, HuggingFaceEndpoint, HuggingFacePipeline

db = SQLDatabase.from_uri(
    "postgresql+psycopg2://postgres:1234@localhost:5432/postgres"
)

# Elasticsearch connection (compatible with Elasticsearch 6.x)
es = Elasticsearch(
    hosts=["http://localhost:9200"],
    http_auth=None,  # Add authentication if needed
    verify_certs=False,
    ssl_show_warn=False,
    request_timeout=30,
    # Add compatibility settings for older Elasticsearch versions
    max_retries=3,
    retry_on_timeout=True
)

def get_schema(_):
    return db.get_table_info()


def run_query(query):
    print(f'Query being run: {query} \n\n')
    return db.run(query)

def format_query_results(query_result):
    """Format PostgreSQL query results as a table"""
    try:
        # Split the result into lines and process
        lines = query_result.strip().split('\n')

        if len(lines) < 2:
            return query_result

        # Extract headers (first line)
        headers = [col.strip() for col in lines[0].split('|')]

        # Extract data rows
        data_rows = []
        for line in lines[1:]:
            if line.strip() and '|' in line:
                row = [cell.strip() for cell in line.split('|')]
                if len(row) == len(headers):
                    data_rows.append(row)

        if data_rows:
            # Create DataFrame and format as table
            df = pd.DataFrame(data_rows, columns=headers)
            return tabulate(df, headers='keys', tablefmt='simple', showindex=False)
        else:
            return query_result

    except Exception as e:
        print(f"Error formatting results: {e}")
        return query_result


# Elasticsearch functions
def get_elasticsearch_indices(es_client=None):
    """Get available Elasticsearch indices"""
    try:
        client = es_client or es
        indices = client.cat.indices(format='json')
        return [index['index'] for index in indices if not index['index'].startswith('.')]
    except Exception as e:
        print(f"Error getting indices: {e}")
        return []


def get_elasticsearch_mapping(index_name):
    """Get mapping for a specific index"""
    try:
        mapping = es.indices.get_mapping(index=index_name)
        return json.dumps(mapping, indent=2)
    except Exception as e:
        print(f"Error getting mapping: {e}")
        return ""


def write_elasticsearch_query(llm, index_name):
    """Generate Elasticsearch query from natural language"""
    template = """Based on the Elasticsearch index mapping below, write an Elasticsearch query that would answer the user's question:
    Index: {index_name}
    Mapping: {mapping}

    Question: {question}

    IMPORTANT: Return only the query body JSON (without index, size, or other parameters).
    Use match_all query to get documents, or match query for specific text search.
    Elasticsearch Query (return only valid JSON):"""

    prompt = ChatPromptTemplate.from_messages(
        [
            ("system", "Given an input question, convert it to an Elasticsearch query body in JSON format. "
            "Return only the query body JSON (without index, size, or other parameters). "
            "Use appropriate Elasticsearch query types like match, term, range, bool, etc. "
            "Example: match_all query to get all documents, or match query for text search."),
            ("human", template),
        ]
    )

    return (
        RunnablePassthrough.assign(
            index_name=lambda x: index_name,
            mapping=lambda x: get_elasticsearch_mapping(index_name)
        )
        | prompt
        | llm
        | StrOutputParser()
    )


def run_elasticsearch_query(index_name, query_json):
    """Execute Elasticsearch query"""
    try:
        print(f'Elasticsearch query being run: {query_json} \n\n')
        query_dict = json.loads(query_json)
        # For Elasticsearch 6.x, use the correct format
        response = es.search(index=index_name, body=query_dict)
        return response
    except Exception as e:
        print(f"Error running Elasticsearch query: {e}")
        return {"error": str(e)}


def format_elasticsearch_results(es_response):
    """Format Elasticsearch results as a table"""
    try:
        if "error" in es_response:
            return f"Error: {es_response['error']}"

        hits = es_response.get('hits', {}).get('hits', [])
        if not hits:
            return "No results found."

        # Extract data from hits
        data_rows = []
        for hit in hits:
            source = hit.get('_source', {})
            data_rows.append(source)

        if data_rows:
            # Create DataFrame and format as table
            df = pd.DataFrame(data_rows)
            return tabulate(df, headers='keys', tablefmt='simple', showindex=False)
        else:
            return "No data to display."

    except Exception as e:
        print(f"Error formatting Elasticsearch results: {e}")
        return str(es_response)



print(get_schema(''))


def get_llm(load_from_hugging_face=False):
    if load_from_hugging_face:
        llm = HuggingFaceEndpoint(
            repo_id="Qwen/Qwen2.5-VL-7B-Instruct",
            task="text-generation",
            provider="hyperbolic",  # set your provider here
        )

        return ChatHuggingFace(llm=llm)

    return ChatOpenAI(model="gpt-4", temperature=0.0)


def write_PostgreSQL_query(llm):
    template = """Based on the table schema below, write a PostgreSQL query that would answer the user's question:
    {schema}

    Question: {question}
    PostgreSQL Query:"""

    prompt = ChatPromptTemplate.from_messages(
        [
            ("system", "Given an input question, convert it to a PostgreSQL query. No pre-amble. "
            "Please do not return anything else apart from the PostgreSQL query, no prefix aur suffix quotes, no PostgreSQL keyword, nothing please"),
            ("human", template),
        ]
    )

    return (
        RunnablePassthrough.assign(schema=get_schema)
        | prompt
        | llm
        | StrOutputParser()
    )

def answer_user_query(query, llm):
    template = """Based on the table schema below, question, PostgreSQL query, and PostgreSQL response, write a natural language response:
    {schema}

    Question: {question}
    PostgreSQL Query: {query}
    PostgreSQL Response: {response}"""

    prompt_response = ChatPromptTemplate.from_messages(
        [
            (
                "system",
                "Given an input question and PostgreSQL response, convert it to a natural language answer. You must return ALL the data from the PostgreSQL response in a clear, organized format. Present each record with complete details. Do not summarize or skip any records. Format the data in a readable table format when possible.",
            ),
            ("human", template),
        ]
    )

    full_chain = (
        RunnablePassthrough.assign(query=write_PostgreSQL_query(llm))
        | RunnablePassthrough.assign(
            schema=get_schema,
            response=lambda x: run_query(x["query"]),
        )
        | prompt_response
        | llm
    )

    return full_chain.invoke({"question": query})

def answer_user_query_with_table(query, llm):
    """Enhanced version that formats results as tables"""
    # Get the query
    query_generator = write_PostgreSQL_query(llm)
    sql_query = query_generator.invoke({"question": query})

    # Run the query
    query_result = run_query(sql_query)

    # Format as table
    formatted_result = format_query_results(query_result)

    # Create a simple response with the table
    response = f"Here are the details for {query}:\n\n{formatted_result}"

    return response


def answer_user_query_elasticsearch(query, llm, index_name):
    """Answer user query using Elasticsearch"""
    try:
        # Get the Elasticsearch query
        query_generator = write_elasticsearch_query(llm, index_name)
        es_query_json = query_generator.invoke({"question": query})

        # Run the Elasticsearch query
        es_response = run_elasticsearch_query(index_name, es_query_json)

        # Format results as table
        formatted_result = format_elasticsearch_results(es_response)

        # Create response
        response = f"Here are the details for {query} (from Elasticsearch index '{index_name}'):\n\n{formatted_result}"

        return response
    except Exception as e:
        return f"Error querying Elasticsearch: {str(e)}"


def select_best_elasticsearch_index(query, llm):
    """Select a single best Elasticsearch index deterministically with high accuracy."""
    try:
        indices = get_elasticsearch_indices()
        if not indices:
            return None

        normalized_query = query.lower()

        keyword_groups = {
            "property": ["property", "assessment", "pt", "unit", "ward"],
            "payment": ["payment", "receipt", "collection", "bill"],
            "water": ["water", "ws", "meter"],
            "sewerage": ["sewer", "sewerage", "sw"],
            "trade": ["trade", "tl", "license"],
            "finance": ["finance", "voucher", "bill"],
            "application": ["application", "apply", "workflow", "wf"],
            "chatbot": ["chatbot", "conversation", "message"],
        }

        penalty_tokens = ["backup", "_backup", "test", "-test", "_test", "demo", "tmp", "temp", "old", "bak"]

        def name_score(index_name):
            name_l = index_name.lower()
            score = 0
            # positive matches by group
            for weight, (group, tokens) in enumerate(keyword_groups.items(), start=1):
                if any(tok in normalized_query for tok in tokens):
                    # boost if index name contains any token from that group
                    if any(tok in name_l for tok in tokens):
                        score += 10 * weight
            # direct token overlaps from query words
            for token in set(normalized_query.replace("-", " ").replace("_", " ").split()):
                if token and token in name_l:
                    score += 2
            # penalties for undesirable indices
            if any(p in name_l for p in penalty_tokens):
                score -= 8
            # mild bonus for concise, production-like names
            if len(index_name) < 26:
                score += 1
            return score

        # Initial scoring by name only
        scored = [(idx, name_score(idx)) for idx in indices]
        scored.sort(key=lambda x: x[1], reverse=True)

        # If top score is clearly higher, pick it immediately
        if scored and (len(scored) == 1 or scored[0][1] - scored[1][1] >= 8):
            return scored[0][0]

        # Mapping-aware boost for the top candidates to refine selection
        top_candidates = [idx for idx, _ in scored[:8]]

        def mapping_boost(index_name):
            try:
                raw = es.indices.get_mapping(index=index_name)
                raw_str = json.dumps(raw).lower()
                boost = 0
                # boost by relevant group presence in mapping fields
                for weight, (group, tokens) in enumerate(keyword_groups.items(), start=1):
                    if any(tok in normalized_query for tok in tokens):
                        if any(tok in raw_str for tok in tokens):
                            boost += 6 * weight
                return boost
            except Exception:
                return 0

        rescored = []
        for idx, base in scored:
            extra = mapping_boost(idx) if idx in top_candidates else 0
            rescored.append((idx, base + extra))
        rescored.sort(key=lambda x: x[1], reverse=True)

        # If still inconclusive (tie within 3 points), optionally fallback to LLM tie-breaker
        if len(rescored) >= 2 and abs(rescored[0][1] - rescored[1][1]) <= 3:
            try:
                candidates = [i for i, _ in rescored[:5]]
                index_selection_template = (
                    "User Query: {query}\n\n"
                    "Candidates: {candidates}\n\n"
                    "Pick the single best index name from candidates only. Return the exact name."
                )
                prompt = ChatPromptTemplate.from_messages([
                    ("system", "Select the most relevant Elasticsearch index from the given candidates. Return only the exact name from the list."),
                    ("human", index_selection_template),
                ])
                chain = (
                    RunnablePassthrough.assign(candidates=lambda x: ", ".join(candidates))
                    | prompt
                    | llm
                    | StrOutputParser()
                )
                selected = chain.invoke({"query": query}).strip()
                if selected in candidates:
                    return selected
            except Exception as _:
                pass

        return rescored[0][0]

    except Exception as e:
        print(f"Error in index selection: {e}")
        fallback = get_elasticsearch_indices()
        return fallback[0] if fallback else None


def answer_user_query_unified(query, llm, data_source="postgresql", index_name=None):
    """Unified function to handle both PostgreSQL and Elasticsearch queries"""
    if data_source.lower() == "elasticsearch":
        if not index_name:
            # Intelligently select the best index based on query content
            index_name = select_best_elasticsearch_index(query, llm)
            if not index_name:
                return "No Elasticsearch indices found. Please specify an index name."
            print(f"Auto-selected index: {index_name}")

        return answer_user_query_elasticsearch(query, llm, index_name)
    else:
        # Default to PostgreSQL
        return answer_user_query_with_table(query, llm)

load_dotenv()

# Example queries
postgresql_query = 'Give me first 20 pgr applications'
elasticsearch_query = 'give me 10 property records'

print("=== PostgreSQL Query Example ===")
print(f"Query: {postgresql_query}")
response_pg = answer_user_query_unified(postgresql_query, llm=get_llm(load_from_hugging_face=False), data_source="postgresql")
print(response_pg)

print("\n" + "="*80 + "\n")

print("=== Elasticsearch Query Example ===")
print(f"Query: {elasticsearch_query}")

# Check if Elasticsearch is available
try:
    print("Testing Elasticsearch connection...")
    print(f"Connection URL: http://localhost:9200")

    # Test basic connection with more detailed error handling
    info = es.info()
    print("Elasticsearch connection successful!")
    print(f"Elasticsearch version: {info.get('version', {}).get('number', 'Unknown')}")

    # Get available indices
    indices = get_elasticsearch_indices()
    print(f"Available indices: {indices}")

    if indices:
        # Let the system automatically select the best index based on the query
        print("Auto-selecting best index based on query content...")
        response_es = answer_user_query_unified(elasticsearch_query, llm=get_llm(load_from_hugging_face=False), data_source="elasticsearch")
        print(response_es)
    else:
        print("No Elasticsearch indices found. Please create an index with some data first.")

except Exception as e:
    print(f"Elasticsearch connection failed: {str(e)}")
    print("Troubleshooting steps:")
    print("1. Ensure kubectl port-forward is running: kubectl port-forward elasticsearch-data-v1-0 -n es-cluster 9200:9200")
    print("2. Test connection manually: curl http://localhost:9200")
    print("3. Check if Elasticsearch requires authentication")

    # Try alternative connection methods for Elasticsearch 6.x
    try:
        print("\nTrying alternative connection for Elasticsearch 6.x...")
        # Use older client configuration for ES 6.x compatibility
        es_alt = Elasticsearch(
            [{"host": "localhost", "port": 9200, "scheme": "http"}],
            timeout=10,
            max_retries=1,
            retry_on_timeout=True
        )

        # Test with a simple info call instead of ping
        info = es_alt.info()
        print("Alternative connection successful!")
        print(f"Elasticsearch version: {info.get('version', {}).get('number', 'Unknown')}")

        # If this works, use the alternative client
        # Note: We'll use es_alt directly for the test

        # Get available indices using the alternative client
        indices = get_elasticsearch_indices(es_alt)
        print(f"Available indices: {indices}")

        if indices:
            # Use the first available index
            index_name = indices[0]
            print(f"Using index: {index_name}")

            # Test a simple query
            print(f"Testing query on index: {index_name}")
            test_query = {"query": {"match_all": {}}, "size": 5}
            test_response = es_alt.search(index=index_name, body=test_query)
            print(f"Test query returned {len(test_response['hits']['hits'])} documents")

            response_es = answer_user_query_unified(elasticsearch_query, llm=get_llm(load_from_hugging_face=False), data_source="elasticsearch", index_name=index_name)
            print(response_es)

    except Exception as e2:
        print(f"Alternative connection failed: {str(e2)}")

print("\n" + "="*80 + "\n")

# print("=== Intelligent Index Selection Demo ===")
# print("Testing different queries to show automatic index selection:")

# # Test different types of queries
# test_queries = [
#     "show me property assessment data",
#     "find payment records",
#     "get water service applications",
#     "search for sewerage connections"
# ]

# for test_query in test_queries:
#     print(f"\n--- Testing Query: '{test_query}' ---")
#     try:
#         # This will automatically select the best index based on the query
#         response = answer_user_query_unified(test_query, llm=get_llm(load_from_hugging_face=False), data_source="elasticsearch")
#         print(f"Selected index and results: {response[:200]}...")
#     except Exception as e:
#         print(f"Error with query '{test_query}': {e}")

# print("\n" + "="*80 + "\n")

print("=== Unified Function Demo ===")
print("You can now use answer_user_query_unified() with:")
print("- data_source='postgresql' for PostgreSQL queries")
print("- data_source='elasticsearch' for Elasticsearch queries (auto-selects best index)")
print("- Specify index_name for Elasticsearch if you want to override auto-selection")

