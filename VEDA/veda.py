#!python3/bin/env python3
# -*- coding: utf-8 -*-

"""
A Python script to initialize a custom Vanna client using ChromaDB as a vector store
and OpenAI as the chat model.
"""

import os
import sys
from vanna.openai import OpenAI_Chat
from vanna.chromadb import ChromaDB_VectorStore
from vanna.flask import VannaFlaskApp
from vanna.flask import MemoryCache
from vanna.flask import AuthInterface, NoAuth


class MyVanna(ChromaDB_VectorStore, OpenAI_Chat):
    def __init__(self, config=None):
        # Initialize both parent classes with the same configuration
        ChromaDB_VectorStore.__init__(self, config=config)
        OpenAI_Chat.__init__(self, config=config)


def main():
    # Ensure the OPENAI_API_KEY environment variable is set
    if 'OPENAI_API_KEY' not in os.environ:
        print("Error: The OPENAI_API_KEY environment variable is not set.")
        sys.exit(1)

    # Replace 'sk-...' and 'gpt-4-...' with your actual API key and model name
    config = {
        'api_key': os.getenv("OPENAI_API_KEY"),      # Your OpenAI API key
        'model': 'gpt-4o'      # Example: 'gpt-4-turbo' or 'gpt-4.1'
    }

    vn = MyVanna(config=config)
    print("Vanna client initialized successfully:", vn)

    vn.connect_to_postgres(host='localhost', dbname='postgres', user='postgres', password='postgres', port='5432')
    print("Connected to PostgreSQL database successfully.")

    # The information schema query may need some tweaking depending on your database. This is a good starting point.
    df_information_schema = vn.run_sql("SELECT * FROM INFORMATION_SCHEMA.COLUMNS")

    # This will break up the information schema into bite-sized chunks that can be referenced by the LLM
    print("Creating training plan from information schema...", df_information_schema)
    plan = vn.get_training_plan_generic(df_information_schema)
    plan

    # If you like the plan, then uncomment this and run it to train
    vn.train(plan=plan)

    trainDDL(vn)
    trainDocumentation(vn)
    trainSQL(vn)


    app = VannaFlaskApp(
        vn,
        MemoryCache(),
        NoAuth(),
        debug=False,
        allow_llm_to_see_data=True,
        logo="https://holashchand.github.io/test_project/digit_logo_light.png",
        title="Ask VEDA",
        subtitle="Your AI-powered data assistant!",
        show_training_data=False,
        suggested_questions=False,
        sql=True,
        table=True,
        csv_download=False,
        chart=False,
        redraw_chart=False,
        auto_fix_sql=True,
        ask_results_correct=False,
        followup_questions=True,
        summarization=True,
        function_generation=True,
        index_html_path=None,
        assets_folder=None,
    )
    app.run()

# Reads from training/ddl folder and trains the model on all DDL files found
def trainDDL(vn):
    ddl_folder = "training/ddl"
    for filename in os.listdir(ddl_folder):
        if filename.endswith(".sql"):
            filepath = os.path.join(ddl_folder, filename)
            with open(filepath, 'r') as file:
                ddl = file.read()
                print(f"Training on DDL file: {filename}")
                vn.train(ddl=ddl)

# Reads from training/data/documentation.json and for each value in the JSON object, trains the model on documentation
def trainDocumentation(vn):
    import json
    doc_file = "training/data/documentation.json"
    with open(doc_file, 'r') as file:
        documentation = json.load(file)
        for key, value in documentation.items():
            print(f"Training on documentation: {key}")
            vn.train(documentation=value)

# Reads from training/data/questions folder where each json file have [{ question: "", sql: ""}, ... ]
#  and trains the model on each question/sql pair
def trainSQL(vn):
    import json
    sql_folder = "training/data/questions"
    for filename in os.listdir(sql_folder):
        if filename.endswith(".json"):
            filepath = os.path.join(sql_folder, filename)
            with open(filepath, 'r') as file:
                qas = json.load(file)
                for qa in qas:
                    question = qa.get("question")
                    sql = qa.get("sql")
                    if question and sql:
                        print(f"Training on question: {question}")
                        vn.train(question=question, sql=sql)


if __name__ == "__main__":
    main()
