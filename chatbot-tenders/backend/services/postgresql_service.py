import asyncpg
import sqlalchemy as sa
from sqlalchemy.ext.asyncio import create_async_engine, AsyncSession
from sqlalchemy.orm import sessionmaker, declarative_base
from sqlalchemy import Column, Integer, String, DateTime, Float, Text, Boolean
from typing import Dict, List, Any, Optional
import os
import json
from datetime import datetime, timedelta
import asyncio

Base = declarative_base()

class User(Base):
    __tablename__ = "users"
    
    id = Column(Integer, primary_key=True, index=True)
    username = Column(String(50), unique=True, index=True)
    email = Column(String(100), unique=True, index=True)
    full_name = Column(String(100))
    department = Column(String(50))
    role = Column(String(50))
    salary = Column(Float)
    hire_date = Column(DateTime)
    is_active = Column(Boolean, default=True)
    created_at = Column(DateTime, default=datetime.utcnow)
    updated_at = Column(DateTime, default=datetime.utcnow, onupdate=datetime.utcnow)

class Product(Base):
    __tablename__ = "products"
    
    id = Column(Integer, primary_key=True, index=True)
    name = Column(String(100), index=True)
    description = Column(Text)
    category = Column(String(50), index=True)
    price = Column(Float)
    stock_quantity = Column(Integer)
    supplier = Column(String(100))
    created_at = Column(DateTime, default=datetime.utcnow)
    updated_at = Column(DateTime, default=datetime.utcnow, onupdate=datetime.utcnow)
    is_active = Column(Boolean, default=True)

class Order(Base):
    __tablename__ = "orders"
    
    id = Column(Integer, primary_key=True, index=True)
    user_id = Column(Integer, index=True)
    product_id = Column(Integer, index=True)
    quantity = Column(Integer)
    unit_price = Column(Float)
    total_amount = Column(Float)
    status = Column(String(20))
    order_date = Column(DateTime, default=datetime.utcnow)
    shipped_date = Column(DateTime)
    delivery_date = Column(DateTime)

class PostgreSQLService:
    def __init__(self):
        self.engine = None
        self.session_maker = None
        self.connection_pool = None
        
        # Database configuration
        self.host = os.getenv("POSTGRES_HOST", "localhost")
        self.port = int(os.getenv("POSTGRES_PORT", 5432))
        self.database = os.getenv("POSTGRES_DB", "hackathon_db")
        self.username = os.getenv("POSTGRES_USER", "admin")
        self.password = os.getenv("POSTGRES_PASSWORD", "password")
        
        self.database_url = f"postgresql+asyncpg://{self.username}:{self.password}@{self.host}:{self.port}/{self.database}"
        
    async def initialize(self):
        """Initialize PostgreSQL connection and create tables"""
        try:
            # Create async engine
            self.engine = create_async_engine(
                self.database_url,
                echo=False,
                pool_size=20,
                max_overflow=0
            )
            
            # Create session maker
            self.session_maker = sessionmaker(
                bind=self.engine,
                class_=AsyncSession,
                expire_on_commit=False
            )
            
            # Test connection
            async with self.engine.begin() as conn:
                await conn.run_sync(Base.metadata.create_all)
            
            print(f"Connected to PostgreSQL at {self.host}:{self.port}")
            
            # Add sample data
            await self._add_sample_data()
            
        except Exception as e:
            print(f"Error connecting to PostgreSQL: {e}")
            print("Note: Make sure PostgreSQL is running and accessible")
    
    async def _add_sample_data(self):
        """Add sample data to the database"""
        try:
            async with self.session_maker() as session:
                # Check if data already exists
                result = await session.execute(sa.text("SELECT COUNT(*) FROM users"))
                count = result.scalar()
                
                if count > 0:
                    print("Sample data already exists in PostgreSQL")
                    return
                
                # Sample users
                users_data = [
                    {
                        "username": "john_doe",
                        "email": "john.doe@company.com",
                        "full_name": "John Doe",
                        "department": "Engineering",
                        "role": "Senior Developer",
                        "salary": 95000.0,
                        "hire_date": datetime(2022, 3, 15)
                    },
                    {
                        "username": "jane_smith",
                        "email": "jane.smith@company.com",
                        "full_name": "Jane Smith",
                        "department": "Marketing",
                        "role": "Marketing Manager",
                        "salary": 85000.0,
                        "hire_date": datetime(2021, 7, 22)
                    },
                    {
                        "username": "mike_wilson",
                        "email": "mike.wilson@company.com",
                        "full_name": "Mike Wilson",
                        "department": "Sales",
                        "role": "Sales Representative",
                        "salary": 65000.0,
                        "hire_date": datetime(2023, 1, 10)
                    },
                    {
                        "username": "sarah_johnson",
                        "email": "sarah.johnson@company.com",
                        "full_name": "Sarah Johnson",
                        "department": "HR",
                        "role": "HR Specialist",
                        "salary": 70000.0,
                        "hire_date": datetime(2022, 9, 5)
                    },
                    {
                        "username": "alex_brown",
                        "email": "alex.brown@company.com",
                        "full_name": "Alex Brown",
                        "department": "Engineering",
                        "role": "DevOps Engineer",
                        "salary": 90000.0,
                        "hire_date": datetime(2023, 4, 18)
                    }
                ]
                
                for user_data in users_data:
                    user = User(**user_data)
                    session.add(user)
                
                # Sample products
                products_data = [
                    {
                        "name": "Laptop Pro 15",
                        "description": "High-performance laptop for professionals",
                        "category": "Electronics",
                        "price": 1999.99,
                        "stock_quantity": 50,
                        "supplier": "TechCorp"
                    },
                    {
                        "name": "Wireless Mouse",
                        "description": "Ergonomic wireless mouse with precision tracking",
                        "category": "Accessories",
                        "price": 49.99,
                        "stock_quantity": 200,
                        "supplier": "GadgetInc"
                    },
                    {
                        "name": "Office Chair",
                        "description": "Comfortable ergonomic office chair",
                        "category": "Furniture",
                        "price": 299.99,
                        "stock_quantity": 75,
                        "supplier": "FurniturePlus"
                    },
                    {
                        "name": "USB-C Hub",
                        "description": "Multi-port USB-C hub with HDMI and power delivery",
                        "category": "Accessories",
                        "price": 79.99,
                        "stock_quantity": 120,
                        "supplier": "TechCorp"
                    },
                    {
                        "name": "Standing Desk",
                        "description": "Adjustable height standing desk",
                        "category": "Furniture",
                        "price": 599.99,
                        "stock_quantity": 30,
                        "supplier": "FurniturePlus"
                    }
                ]
                
                for product_data in products_data:
                    product = Product(**product_data)
                    session.add(product)
                
                await session.commit()
                
                # Get user and product IDs for orders
                users = await session.execute(sa.select(User))
                products = await session.execute(sa.select(Product))
                
                user_ids = [user.id for user in users.scalars()]
                product_list = list(products.scalars())
                
                # Sample orders
                orders_data = [
                    {
                        "user_id": user_ids[0],
                        "product_id": product_list[0].id,
                        "quantity": 1,
                        "unit_price": product_list[0].price,
                        "total_amount": product_list[0].price,
                        "status": "delivered",
                        "order_date": datetime(2024, 1, 15),
                        "shipped_date": datetime(2024, 1, 17),
                        "delivery_date": datetime(2024, 1, 20)
                    },
                    {
                        "user_id": user_ids[1],
                        "product_id": product_list[1].id,
                        "quantity": 2,
                        "unit_price": product_list[1].price,
                        "total_amount": product_list[1].price * 2,
                        "status": "shipped",
                        "order_date": datetime(2024, 2, 1),
                        "shipped_date": datetime(2024, 2, 3)
                    },
                    {
                        "user_id": user_ids[2],
                        "product_id": product_list[2].id,
                        "quantity": 1,
                        "unit_price": product_list[2].price,
                        "total_amount": product_list[2].price,
                        "status": "pending",
                        "order_date": datetime(2024, 2, 5)
                    }
                ]
                
                for order_data in orders_data:
                    order = Order(**order_data)
                    session.add(order)
                
                await session.commit()
                
                print("Added sample data to PostgreSQL")
                
        except Exception as e:
            print(f"Error adding sample data to PostgreSQL: {e}")
    
    async def query(self, query_params: Dict[str, Any]) -> Dict[str, Any]:
        """Execute query on PostgreSQL"""
        try:
            if not self.engine:
                return {"error": "PostgreSQL not initialized", "results": []}
            
            # Build SQL query
            sql_query = self._build_sql_query(query_params)
            
            # Execute query
            async with self.session_maker() as session:
                result = await session.execute(sa.text(sql_query))
                
                # Handle different types of results
                if result.returns_rows:
                    rows = result.fetchall()
                    columns = result.keys()
                    
                    results = []
                    for row in rows:
                        row_dict = dict(zip(columns, row))
                        # Convert datetime objects to strings
                        for key, value in row_dict.items():
                            if isinstance(value, datetime):
                                row_dict[key] = value.isoformat()
                        results.append(row_dict)
                else:
                    results = []
                
                return self._process_sql_results(results, query_params, sql_query)
                
        except Exception as e:
            print(f"Error executing PostgreSQL query: {e}")
            return {"error": str(e), "results": []}
    
    def _build_sql_query(self, query_params: Dict[str, Any]) -> str:
        """Build SQL query from parameters"""
        intent = query_params.get("intent", "search_data")
        entities = query_params.get("entities", [])
        filters = query_params.get("filters", [])
        aggregations = query_params.get("aggregations", [])
        temporal_info = query_params.get("temporal_info", {})
        
        # Determine primary table based on entities and intent
        primary_table = self._determine_primary_table(entities, query_params)
        
        # Build SELECT clause
        select_clause = self._build_select_clause(aggregations, primary_table, intent)
        
        # Build FROM clause
        from_clause = f"FROM {primary_table}"
        
        # Build JOIN clauses if needed
        join_clauses = self._build_join_clauses(primary_table, entities)
        
        # Build WHERE clause
        where_clause = self._build_where_clause(filters, temporal_info, primary_table)
        
        # Build GROUP BY clause
        group_by_clause = self._build_group_by_clause(aggregations)
        
        # Build ORDER BY clause
        order_by_clause = self._build_order_by_clause(query_params, primary_table)
        
        # Build LIMIT clause
        limit_clause = self._build_limit_clause(query_params)
        
        # Assemble final query
        query_parts = [f"SELECT {select_clause}", from_clause]
        
        if join_clauses:
            query_parts.extend(join_clauses)
        
        if where_clause:
            query_parts.append(f"WHERE {where_clause}")
        
        if group_by_clause:
            query_parts.append(f"GROUP BY {group_by_clause}")
        
        if order_by_clause:
            query_parts.append(f"ORDER BY {order_by_clause}")
        
        if limit_clause:
            query_parts.append(limit_clause)
        
        return " ".join(query_parts)
    
    def _determine_primary_table(self, entities: List[Dict[str, Any]], query_params: Dict[str, Any]) -> str:
        """Determine the primary table for the query"""
        original_query = query_params.get("original_query", "").lower()
        
        # Table keywords mapping
        table_keywords = {
            "users": ["user", "employee", "person", "staff", "worker"],
            "products": ["product", "item", "inventory", "goods"],
            "orders": ["order", "purchase", "transaction", "sale"]
        }
        
        # Check entities for table names
        for entity in entities:
            entity_text = entity.get("text", "").lower()
            if entity_text in table_keywords:
                return entity_text
        
        # Check original query for table keywords
        for table, keywords in table_keywords.items():
            for keyword in keywords:
                if keyword in original_query:
                    return table
        
        # Default to users table
        return "users"
    
    def _build_select_clause(self, aggregations: List[Dict[str, Any]], table: str, intent: str) -> str:
        """Build SELECT clause"""
        if aggregations:
            select_parts = []
            for agg in aggregations:
                agg_type = agg.get("type")
                field = agg.get("field")
                
                if agg_type == "count":
                    if field == "*" or not field:
                        select_parts.append("COUNT(*) as count_all")
                    else:
                        select_parts.append(f"COUNT({field}) as count_{field}")
                elif agg_type == "sum":
                    select_parts.append(f"SUM({field}) as sum_{field}")
                elif agg_type == "avg":
                    select_parts.append(f"AVG({field}) as avg_{field}")
                elif agg_type == "max":
                    select_parts.append(f"MAX({field}) as max_{field}")
                elif agg_type == "min":
                    select_parts.append(f"MIN({field}) as min_{field}")
                elif agg_type == "group_by":
                    select_parts.append(field)
            
            return ", ".join(select_parts) if select_parts else "*"
        
        # For non-aggregation queries, select all columns
        return "*"
    
    def _build_join_clauses(self, primary_table: str, entities: List[Dict[str, Any]]) -> List[str]:
        """Build JOIN clauses if multiple tables are needed"""
        joins = []
        
        # Simple join logic - can be expanded based on schema
        if primary_table == "orders":
            # Check if user or product information is needed
            entity_texts = [e.get("text", "").lower() for e in entities]
            
            if any("user" in text or "employee" in text for text in entity_texts):
                joins.append("JOIN users ON orders.user_id = users.id")
            
            if any("product" in text or "item" in text for text in entity_texts):
                joins.append("JOIN products ON orders.product_id = products.id")
        
        return joins
    
    def _build_where_clause(self, filters: List[Dict[str, Any]], temporal_info: Dict[str, Any], table: str) -> str:
        """Build WHERE clause"""
        conditions = []
        
        # Add filter conditions
        for filter_item in filters:
            condition = self._convert_filter_to_sql(filter_item)
            if condition:
                conditions.append(condition)
        
        # Add temporal conditions
        if temporal_info.get("has_time_constraint"):
            time_condition = self._build_time_condition(temporal_info, table)
            if time_condition:
                conditions.append(time_condition)
        
        # Add default active condition for applicable tables
        if table in ["users", "products"]:
            conditions.append(f"{table}.is_active = true")
        
        return " AND ".join(conditions) if conditions else ""
    
    def _convert_filter_to_sql(self, filter_item: Dict[str, Any]) -> Optional[str]:
        """Convert filter to SQL condition"""
        field = filter_item.get("field")
        operator = filter_item.get("operator")
        value = filter_item.get("value")
        
        if not field or not operator:
            return None
        
        # Handle string values
        if isinstance(value, str):
            value = f"'{value}'"
        
        if operator == "=" or operator == "is":
            return f"{field} = {value}"
        elif operator == "!=" or operator == "is_not":
            return f"{field} != {value}"
        elif operator == ">":
            return f"{field} > {value}"
        elif operator == ">=":
            return f"{field} >= {value}"
        elif operator == "<":
            return f"{field} < {value}"
        elif operator == "<=":
            return f"{field} <= {value}"
        elif operator == "contains":
            return f"{field} ILIKE '%{value.strip(chr(39))}%'"
        elif operator == "between" and isinstance(filter_item.get("value"), list):
            val_list = filter_item.get("value")
            if len(val_list) == 2:
                return f"{field} BETWEEN {val_list[0]} AND {val_list[1]}"
        
        return None
    
    def _build_time_condition(self, temporal_info: Dict[str, Any], table: str) -> Optional[str]:
        """Build time-based condition"""
        if not temporal_info.get("has_time_constraint"):
            return None
        
        # Determine the date field based on table
        date_field = self._get_date_field_for_table(table)
        if not date_field:
            return None
        
        relative_time = temporal_info.get("relative_time")
        if not relative_time:
            return None
        
        now = datetime.now()
        
        if "days" in relative_time:
            days = relative_time["days"]
            if days == 0:  # today
                return f"DATE({date_field}) = CURRENT_DATE"
            else:
                target_date = now + timedelta(days=days)
                return f"{date_field} >= '{target_date.isoformat()}'"
        elif "months" in relative_time:
            months = relative_time["months"]
            if months == 0:  # this month
                return f"EXTRACT(MONTH FROM {date_field}) = EXTRACT(MONTH FROM CURRENT_DATE) AND EXTRACT(YEAR FROM {date_field}) = EXTRACT(YEAR FROM CURRENT_DATE)"
            else:
                # Approximate calculation
                target_date = now + timedelta(days=months * 30)
                return f"{date_field} >= '{target_date.isoformat()}'"
        
        return None
    
    def _get_date_field_for_table(self, table: str) -> Optional[str]:
        """Get the appropriate date field for a table"""
        date_field_mapping = {
            "users": "hire_date",
            "products": "created_at",
            "orders": "order_date"
        }
        
        return date_field_mapping.get(table)
    
    def _build_group_by_clause(self, aggregations: List[Dict[str, Any]]) -> str:
        """Build GROUP BY clause"""
        group_fields = []
        
        for agg in aggregations:
            if agg.get("type") == "group_by":
                field = agg.get("field")
                if field:
                    group_fields.append(field)
        
        return ", ".join(group_fields) if group_fields else ""
    
    def _build_order_by_clause(self, query_params: Dict[str, Any], table: str) -> str:
        """Build ORDER BY clause"""
        sort_field = query_params.get("sort_field")
        sort_order = query_params.get("sort_order", "DESC")
        
        if sort_field:
            return f"{sort_field} {sort_order}"
        
        # Default sorting based on table
        default_sort = {
            "users": "created_at DESC",
            "products": "created_at DESC",
            "orders": "order_date DESC"
        }
        
        return default_sort.get(table, "id DESC")
    
    def _build_limit_clause(self, query_params: Dict[str, Any]) -> str:
        """Build LIMIT clause"""
        limit = query_params.get("limit", 50)
        return f"LIMIT {limit}"
    
    def _process_sql_results(self, results: List[Dict[str, Any]], query_params: Dict[str, Any], sql_query: str) -> Dict[str, Any]:
        """Process SQL query results"""
        return {
            "source": "postgresql",
            "total_results": len(results),
            "results": results,
            "query_info": {
                "sql_query": sql_query,
                "query_type": "postgresql"
            }
        }
    
    async def get_schema(self) -> Dict[str, Any]:
        """Get database schema information"""
        try:
            if not self.engine:
                return {"error": "PostgreSQL not initialized"}
            
            schema_info = {
                "tables": {},
                "relationships": []
            }
            
            # Get table information
            async with self.session_maker() as session:
                # Get table names and column information
                tables_query = """
                SELECT table_name, column_name, data_type, is_nullable
                FROM information_schema.columns
                WHERE table_schema = 'public'
                ORDER BY table_name, ordinal_position
                """
                
                result = await session.execute(sa.text(tables_query))
                rows = result.fetchall()
                
                for row in rows:
                    table_name, column_name, data_type, is_nullable = row
                    
                    if table_name not in schema_info["tables"]:
                        schema_info["tables"][table_name] = []
                    
                    schema_info["tables"][table_name].append({
                        "name": column_name,
                        "type": data_type,
                        "nullable": is_nullable == "YES"
                    })
            
            return schema_info
            
        except Exception as e:
            print(f"Error getting PostgreSQL schema: {e}")
            return {"error": str(e)}
    
    async def health_check(self) -> bool:
        """Check if PostgreSQL is healthy"""
        try:
            if not self.engine:
                return False
            
            async with self.session_maker() as session:
                await session.execute(sa.text("SELECT 1"))
                return True
                
        except Exception as e:
            print(f"PostgreSQL health check failed: {e}")
            return False
    
    async def close(self):
        """Close PostgreSQL connection"""
        if self.engine:
            await self.engine.dispose()