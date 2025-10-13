from crewai.tools import BaseTool
from typing import Optional, Type
from pydantic import BaseModel, Field
import os
import json

try:
    import psycopg
except Exception:  # pragma: no cover - optional dependency
    psycopg = None


class PostgresQueryInput(BaseModel):
    """Input schema for PostgresQueryTool."""
    sql: str = Field(..., description="SQL to execute. Use parameter placeholders if needed.")
    params_json: Optional[str] = Field(
        default=None, description="Optional JSON array of parameters to bind to the SQL."
    )


class PostgresQueryTool(BaseTool):
    name: str = "postgres_query"
    description: str = (
        "Execute read-only SQL against PostgreSQL. Use for precise tabular data retrieval."
    )
    args_schema: Type[BaseModel] = PostgresQueryInput

    def _run(self, sql: str, params_json: Optional[str] = None) -> str:
        if psycopg is None:
            return json.dumps({"error": "psycopg not installed"})

        dsn = os.getenv("PG_DSN") or self._compose_pg_dsn()
        if not dsn:
            return json.dumps({"error": "PostgreSQL connection not configured"})

        try:
            params = json.loads(params_json) if params_json else None
        except Exception as exc:
            return json.dumps({"error": f"Invalid params_json: {exc}"})

        try:
            with psycopg.connect(dsn, autocommit=True) as conn:
                with conn.cursor() as cur:
                    cur.execute(sql, params)
                    if cur.description is None:
                        return json.dumps({"rows": [], "columns": []})
                    columns = [c.name for c in cur.description]
                    rows = cur.fetchall()
            return json.dumps({"rows": rows, "columns": columns})
        except Exception as exc:
            return json.dumps({"error": str(exc)})

    @staticmethod
    def _compose_pg_dsn() -> Optional[str]:
        host = os.getenv("PGHOST")
        db = os.getenv("PGDATABASE")
        user = os.getenv("PGUSER")
        pwd = os.getenv("PGPASSWORD")
        port = os.getenv("PGPORT", "5432")
        if not (host and db and user and pwd):
            return None
        return f"host={host} port={port} dbname={db} user={user} password={pwd}"




class PostgresSchemaInput(BaseModel):
    """Input for PostgresSchemaTool."""
    table_schema: Optional[str] = Field(default=None, description="Filter by schema, e.g., 'public'.")
    table_name: Optional[str] = Field(default=None, description="Optional table to inspect. If omitted, returns all tables and columns.")


class PostgresSchemaTool(BaseTool):
    name: str = "postgres_schema"
    description: str = (
        "List PostgreSQL tables and columns for grounding LLM queries. Optionally filter by schema/table."
    )
    args_schema: Type[BaseModel] = PostgresSchemaInput

    def _run(self, table_schema: Optional[str] = None, table_name: Optional[str] = None) -> str:
        if psycopg is None:
            return json.dumps({"error": "psycopg not installed"})
        dsn = os.getenv("PG_DSN") or PostgresQueryTool._compose_pg_dsn()
        if not dsn:
            return json.dumps({"error": "PostgreSQL connection not configured"})
        filters = []
        params = []
        if table_schema:
            filters.append("table_schema = %s")
            params.append(table_schema)
        if table_name:
            filters.append("table_name = %s")
            params.append(table_name)
        where = ("WHERE " + " AND ".join(filters)) if filters else ""
        sql = f"""
            SELECT table_schema, table_name, column_name, data_type
            FROM information_schema.columns
            {where}
            ORDER BY table_schema, table_name, ordinal_position
        """
        try:
            with psycopg.connect(dsn, autocommit=True) as conn:
                with conn.cursor() as cur:
                    cur.execute(sql, params or None)
                    rows = cur.fetchall()
            return json.dumps({"columns": ["table_schema", "table_name", "column_name", "data_type"], "rows": rows})
        except Exception as exc:
            return json.dumps({"error": str(exc)})


class ElasticsearchMappingInput(BaseModel):
    """Deprecated placeholder to avoid import errors if referenced elsewhere."""
    index: str = Field(..., description="Deprecated")


class ElasticsearchMappingTool(BaseTool):
    name: str = "elasticsearch_mapping"
    description: str = "Deprecated: Elasticsearch support removed."
    args_schema: Type[BaseModel] = ElasticsearchMappingInput

    def _run(self, index: str) -> str:
        return json.dumps({"error": "Elasticsearch support removed. Use Postgres tools."})
