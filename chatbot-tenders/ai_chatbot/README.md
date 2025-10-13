# AiChatbot Crew

Welcome to the AiChatbot Crew project, powered by [crewAI](https://crewai.com). This template is designed to help you set up a multi-agent AI system with ease, leveraging the powerful and flexible framework provided by crewAI. Our goal is to enable your agents to collaborate effectively on complex tasks, maximizing their collective intelligence and capabilities.

## Dual-source Natural Language Query (Elasticsearch + PostgreSQL)

This project includes tools to query both PostgreSQL and Elasticsearch and to compose a combined answer:

- `postgres_query`: execute read-only SQL against PostgreSQL
- `elasticsearch_query`: run JSON DSL queries against Elasticsearch
- `dual_source_query`: retrieve from both sources and return a composed JSON payload

### Environment Variables

PostgreSQL:

- `PG_DSN` (optional): full DSN string, or specify the following:
- `PGHOST`, `PGPORT` (default `5432`), `PGDATABASE`, `PGUSER`, `PGPASSWORD`

Elasticsearch:

- `ES_URL` (default `http://localhost:9200`)
- `ES_USER`, `ES_PASSWORD` (optional for basic auth)
- `ES_DEFAULT_INDEX` (optional, default `documents`)

## Installation

Ensure you have Python >=3.10 <3.14 installed on your system. This project uses [UV](https://docs.astral.sh/uv/) for dependency management and package handling, offering a seamless setup and execution experience.

First, if you haven't already, install uv:

```bash
pip install uv
```

Next, navigate to your project directory and install the dependencies:

(Optional) Lock the dependencies and install them by using the CLI command:
```bash
crewai install
```
### Customizing

**Add your `OPENAI_API_KEY` into the `.env` file**

- Modify `src/ai_chatbot/config/agents.yaml` to define your agents
- Modify `src/ai_chatbot/config/tasks.yaml` to define your tasks
- Modify `src/ai_chatbot/crew.py` to add your own logic, tools and specific args
- Modify `src/ai_chatbot/main.py` to add custom inputs for your agents and tasks

### Run dual-source demo

```bash
pip install -e .

export PGHOST=localhost
export PGDATABASE=app
export PGUSER=app
export PGPASSWORD=secret
export ES_URL=http://localhost:9200
export ES_DEFAULT_INDEX=documents

crewai run
```

You can also invoke tools directly in Python:

```python
from ai_chatbot.tools.custom_tool import PostgresQueryTool, ElasticsearchQueryTool, DualSourceQueryTool

print(PostgresQueryTool().run({"sql": "SELECT 1 AS x"}))
print(ElasticsearchQueryTool().run({"index": "documents", "query_json": "{\"match_all\": {}}", "size": 5}))
print(DualSourceQueryTool().run({"question": "What are the latest error logs and daily counts?"}))
```

## Running the Project

To kickstart your crew of AI agents and begin task execution, run this from the root folder of your project:

```bash
$ crewai run
```

This command initializes the AI-chatBot Crew, assembling the agents and assigning them tasks as defined in your configuration.

This example, unmodified, will run the create a `report.md` file with the output of a research on LLMs in the root folder.

## Understanding Your Crew

The AI-chatBot Crew is composed of multiple AI agents, each with unique roles, goals, and tools. These agents collaborate on a series of tasks, defined in `config/tasks.yaml`, leveraging their collective skills to achieve complex objectives. The `config/agents.yaml` file outlines the capabilities and configurations of each agent in your crew.

## Support

For support, questions, or feedback regarding the AiChatbot Crew or crewAI.
- Visit our [documentation](https://docs.crewai.com)
- Reach out to us through our [GitHub repository](https://github.com/joaomdmoura/crewai)
- [Join our Discord](https://discord.com/invite/X4JWnZnxPb)
- [Chat with our docs](https://chatg.pt/DWjSBZn)

Let's create wonders together with the power and simplicity of crewAI.
