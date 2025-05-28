import getpass
import os
import streamlit as st
# from langchain_huggingface import ChatHuggingFace, HuggingFaceEndpoint, HuggingFacePipeline
# from transformers import AutoTokenizer, AutoModelForCausalLM, GenerationConfig
import torch
from langchain.chains.query_constructor.schema import AttributeInfo
# from langchain_core.documents import Document
from elasticsearch import Elasticsearch
from langchain_elasticsearch import ElasticsearchStore
from langchain.agents import initialize_agent, AgentType, Tool, AgentExecutor
from langchain_core.messages import AIMessage, HumanMessage, SystemMessage
from langchain_core.tools import tool, StructuredTool
from pydantic import BaseModel, Field
from langchain.memory import ConversationBufferMemory
from datetime import datetime, timezone
from elasticsearch.helpers import scan
# from langchain_huggingface import HuggingFaceEmbeddings

st.title("monitorAI Alpha")

if "messages" not in st.session_state:
    st.session_state.messages = []

for message in st.session_state.messages:
    with st.chat_message(message["role"]):
        st.markdown(message["content"])

# huggingface_api_key = st.sidebar.text_input("Huggingface API Key", type="password")


from langchain_openai import OpenAIEmbeddings, OpenAI
# from langchain_huggingface import HuggingFaceEmbeddings
from langchain.retrievers.self_query.base import SelfQueryRetriever
if not os.environ.get("OPENAI_API_KEY"):
    os.environ["OPENAI_API_KEY"] = st.secrets["OPENAI_API_KEY"]

# Below are attempts at getting a HF model working, but without cloud space, we were not able to run this

# model_name = "deepseek-ai/deepseek-llm-7b-chat"
# tokenizer = AutoTokenizer.from_pretrained(model_name)
# model = AutoModelForCausalLM.from_pretrained(model_name, torch_dtype=torch.bfloat16, device_map="auto")
# model.generation_config = GenerationConfig.from_pretrained(model_name)
# model.generation_config.pad_token_id = model.generation_config.eos_token_id

# messages = [
#     {"role": "user", "content": "Who are you?"}
# ]
# input_tensor = tokenizer.apply_chat_template(messages, add_generation_prompt=True, return_tensors="pt")
# outputs = model.generate(input_tensor.to(model.device), max_new_tokens=100)

# result = tokenizer.decode(outputs[0][input_tensor.shape[1]:], skip_special_tokens=True)
# print(result)

# llm = HuggingFaceEndpoint(
#     repo_id="HuggingFaceH4/zephyr-7b-beta",
#     task="text-generation",
#     max_new_tokens=512,
#     do_sample=False,
#     repetition_penalty=1.03,
# )

# from transformers import BitsAndBytesConfig

# quantization_config = BitsAndBytesConfig(
#     load_in_4bit=True,
#     bnb_4bit_quant_type="nf4",
#     bnb_4bit_compute_dtype="float16",
#     bnb_4bit_use_double_quant=True,
# )

# llm = HuggingFacePipeline.from_model_id(
#     model_id="HuggingFaceH4/zephyr-7b-beta",
#     task="text-generation",
#     pipeline_kwargs=dict(
#         max_new_tokens=512,
#         do_sample=False,
#         repetition_penalty=1.03,
#         return_full_text=False,
#     ),
#     model_kwargs={"quantization_config": quantization_config},
# )

# hf = HuggingFaceEmbeddings(
#     model_name="HuggingFaceH4/zephyr-7b-beta"
#     # model_kwargs={"quantization_config": quantization_config}
# )

# chat_model = ChatHuggingFace(llm=llm)

# from langchain_core.messages import (
#     HumanMessage,
#     SystemMessage,
# )

es_client = Elasticsearch(
    "https://unified-dev-monitorai.digit.org/",
    basic_auth=(st.secrets["ES_USER"], st.secrets["ES_PASS"]),
    verify_certs=False,
    ssl_show_warn=False
)

# print(es_client.indices.get_mapping(index="property-application"))

# hf_embeddings = HuggingFaceEmbeddings(
#     model_name="HuggingFaceH4/zephyr-7b-beta"
# )

oai_embeddings = OpenAIEmbeddings(model="text-embedding-3-large")

tool_list = []

# Currently designed for one index
index = "pgr-monitorai-testing"

# Below is the list of tools, which each get appended to tool_list to be included in the agent. Each of them assumes the ES code runs "scan" (which gets all entries that match), that it runs on a specific index, that it returns a string for the LLM to process for the output. The documentation strings that define the function in each tool are what are read by the LLM to pick which tool should be used. This means that it is good to keep those descriptions verbose, trying to aaccount for variations of words, and trying to not have it conflict with other tools too much. 

@tool("count_tool", parse_docstring=True)
def count_tool() ->  str:
    """
    Useful for counting documents in the Elasticsearch index pgr-monitorai-testing. Input should be a natural language query with no parameters.

    """
    count = es_client.count(index=index)["count"]
    return f"There are {count} documents in index {index}."
tool_list.append(count_tool)

@tool("count_incity_tool", parse_docstring=True)
def count_incity_tool(city: str) ->  str:
    """
    Useful for counting documents in the Elasticsearch index pgr-monitorai-testing for a specific city. Input should be a natural language query with one parameters, the name of the city.

    Args:
        city: City by which we will filter the documents in the index
    """
    response = scan(es_client, query = {"_source": {"exclude": ["vector"]}, "query": {"query_string":{"query": "metadata.city:" + city}}}, index=index)
    count = 0
    for r in response:
        count += 1
    return f"There are {count} documents in index {index} for city {city}."
tool_list.append(count_incity_tool)

@tool("fetch_incity_tool", parse_docstring=True)
def fetch_incity_tool(city: str) ->  str:
    """
    Useful for fetching documents in the Elasticsearch index pgr-monitorai-testing for a specific city. Input should be a natural language query with one parameter, the name of the city.

    Args:
        city: City by which we will filter the documents in the index
    """
    response = scan(es_client, query = {"_source": {"exclude": ["vector"]}, "query": {"query_string":{"query": "metadata.city:" + city}}}, index=index)
    count = 0
    for r in response:
        count += 1
    return f"There are {count} documents in index {index} for city {city}.\nDocuments are {response}"
tool_list.append(fetch_incity_tool)

@tool("count_incity_forchannel_tool", parse_docstring=True)
def count_incity_forchannel_tool(city: str, channel: str) ->  str:
    """
    Useful for counting documents in the Elasticsearch index pgr-monitorai-testing for a specific city, given the channel through which applications were made. Input should be a natural language query with two parameters, the name of the city and the channel.

    Args:
        city: City by which we will filter the documents in the index
        channel: Channel through which (or via which) the applications were made
    """
    response = scan(es_client, query = {"_source": {"exclude": ["vector"]}, "query": {"query_string":{"query": "(metadata.city:" + city + ") AND (metadata.channel:" + channel + ")"}}}, index=index)
    count = 0
    for r in response:
        count += 1
    return f"There are {count} documents in index {index} for city {city}, for the channel {channel}"
tool_list.append(count_incity_forchannel_tool)

@tool("count_incity_currentstatus_tool", parse_docstring=True)
def count_incity_currentstatus_tool(city: str, status: str) ->  str:
    """
    Useful for counting documents in the Elasticsearch index pgr-monitorai-testing for a specific city, filtered by their current status. Input should be a natural language query with two parameters, the name of the city and the status by whwich to filter.

    Args:
        city: City by which we will filter the documents in the index
        status: Status by which to filter the documents
    """
    response = scan(es_client, query = {"_source": {"exclude": ["vector"]}, "query": {"query_string":{"query": "(metadata.city:" + city + ") AND (metadata.currentstatus:" + status + ")"}}}, index=index)
    count = 0
    for r in response:
        count += 1
    return f"There are {count} documents in index {index} for city {city}, for the status {status}"
tool_list.append(count_incity_currentstatus_tool)

@tool("issues_incity", parse_docstring=True)
def issues_incity(city: str) ->  str:
    """
    Useful for counting how many of each kind of issue (or service) has been logged in the Elasticsearch index pgr-monitorai-testing for a specific city. Input should be a natural language query with one parameter, the name of the city.

    Args:
        city: City by which we will filter the documents in the index
    """
    response = scan(es_client, query = {"_source": {"exclude": ["vector"]}, "query": {"query_string":{"query": "(metadata.city:" + city + ")"}}}, index=index)
    counter_dict = {}
    for r in response:
        print(r)
        if r["_source"]["metadata"]["servicecode"] not in counter_dict:
            counter_dict[r["_source"]["metadata"]["servicecode"]] = 0.0
        counter_dict[r["_source"]["metadata"]["servicecode"]] += 1.0
    ret_str = f"For city {city}, the following are the issues:\n"
    for k, v in counter_dict.items():
        ret_str += f"{k}: {v} counts\n"
    return ret_str
tool_list.append(issues_incity)

@tool("count_mohallas_incity", parse_docstring=True)
def count_mohallas_incity(city: str) ->  str:
    """
    Useful for counting how many mohallas (or localities or areas) have been logged in the Elasticsearch index pgr-monitorai-testing for a specific city. Input should be a natural language query with one parameter, the name of the city.

    Args:
        city: City by which we will filter the documents in the index
    """
    response = scan(es_client, query = {"_source": {"exclude": ["vector"]}, "query": {"query_string":{"query": "(metadata.city:" + city + ")"}}}, index=index)
    mohalla_list = []
    for r in response:
        mohalla_list.append(r["_source"]["metadata"]["mohalla"])
    mohalla_list = list(set(mohalla_list))
    return f"For city {city}, there are {len(mohalla_list)} mohallas"
tool_list.append(count_mohallas_incity)

@tool("mohallas_incity", parse_docstring=True)
def mohallas_incity(city: str) ->  str:
    """
    Useful for counting how many mohallas (or localities or areas) have been logged in the Elasticsearch index pgr-monitorai-testing for a specific city. It also counts the number of issues in each mohalla. Input should be a natural language query with one parameter, the name of the city. 

    Args:
        city: City by which we will filter the documents in the index
    """
    response = scan(es_client, query = {"_source": {"exclude": ["vector"]}, "query": {"query_string":{"query": "(metadata.city:" + city + ")"}}}, index=index)
    counter_dict = {}
    for r in response:
        print(r)
        if r["_source"]["metadata"]["mohalla"] not in counter_dict:
            counter_dict[r["_source"]["metadata"]["mohalla"]] = 0.0
        counter_dict[r["_source"]["metadata"]["mohalla"]] += 1.0
    ret_str = f"For city {city}, the following are the mohallas:\n"
    for k, v in counter_dict.items():
        ret_str += f"{k}: {v} counts\n"
    return ret_str
tool_list.append(mohallas_incity)

@tool("issues_inmohalla_incity", parse_docstring=True)
def issues_inmohalla_incity(city: str) ->  str:
    """
    Useful for counting how many kinds of issues (and how many of each kind) have been logged in the Elasticsearch index pgr-monitorai-testing for a specific mohallas (or localities or areas) in a specific city. Input should be a natural language query with one parameter, the name of the city. Don't use this if you don't want the kinds of issues, but only the counts.

    Args:
        city: City by which we will filter the documents in the index
    """
    response = scan(es_client, query = {"_source": {"exclude": ["vector"]}, "query": {"query_string":{"query": "(metadata.city:" + city + ")"}}}, index=index)
    counter_dict = {}
    for r in response:
        print(r)
        if r["_source"]["metadata"]["mohalla"] not in counter_dict:
            counter_dict[r["_source"]["metadata"]["mohalla"]] = {}
        if r["_source"]["metadata"]["servicecode"] not in counter_dict[r["_source"]["metadata"]["mohalla"]]:
            counter_dict[r["_source"]["metadata"]["mohalla"]][r["_source"]["metadata"]["servicecode"]] = 0.0
        counter_dict[r["_source"]["metadata"]["mohalla"]][r["_source"]["metadata"]["servicecode"]] += 1.0
    ret_str = f"For city {city}, the following are the mohallas:\n"
    for k, v in counter_dict.items():
        ret_str += f"{k}, issues are: \n"
        for k2, v2 in v.items():
            ret_str += f"{k2}: {v2} counts\n"
    return ret_str
tool_list.append(issues_inmohalla_incity)

@tool("count_currentstatus_tool", parse_docstring=True)
def count_currentstatus_tool(status: str) ->  str:
    """
    Useful for counting documents in the Elasticsearch index pgr-monitorai-testing that have a particular current status. Input should be a natural language query with one parameter, the status being searched for.

    Args:
        status: Status for which to count the documents
    """
    response = scan(es_client, query = {"query":{"query_string":{"query": "metadata.currentstatus:" + status}}}, index=index)
    count = 0
    for r in response:
        count += 1
    return f"There are {count} documents in index {index} for status {status}."
tool_list.append(count_currentstatus_tool)

@tool("count_channel_tool", parse_docstring=True)
def count_channel_tool(channel: str) ->  str:
    """
    Useful for counting documents in the Elasticsearch index pgr-monitorai-testing that have come in via a particular channel. Input should be a natural language query with one parameter, the channel being searched for.

    Args:
        channel: Channel through which (or via which) the applications were made, which we have to count for
    """
    response = scan(es_client, query = {"query":{"query_string":{"query": "metadata.channel:" + channel}}}, index=index)
    count = 0
    for r in response:
        count += 1
    return f"There are {count} documents in index {index} for channel {channel}."
tool_list.append(count_channel_tool)

@tool("count_afterstartdate_tool", parse_docstring=True)
def count_afterstartdate_tool(start_date: int) ->  str:
    """
    Useful for counting documents in the Elasticsearch index pgr-monitorai-testing that have come in after a given start date. Input should be a natural language query with one parameter, the start date in the epoch or integer format.

    Args:
        start_date: The date in integer or epoch format, by which we will filter the applications to get a count of all received applications after this date
    """
    response = scan(es_client, query = {"query":{"query_string":{"query": "metadata.startdate:>=" + str(start_date)}}}, index=index)
    count = 0
    for r in response:
        count += 1
    return f"There are {count} documents in index {index} after start date {str(start_date)}."
tool_list.append(count_afterstartdate_tool)

@tool("count_afterstartdate_string_tool", parse_docstring=True)
def count_afterstartdate_string_tool(start_date: str) ->  str:
    """
    Useful for counting documents in the Elasticsearch index pgr-monitorai-testing that have come in after a given start date. Input should be a natural language query with one parameter, the start date in a textual (%Y-%m-%d %H:%M:%S) format.

    Args:
        start_date: The date in textual (%Y-%m-%d %H:%M:%S) format, by which we will filter the applications to get a count of all applications received after this date
    """
    dt = datetime.strptime(start_date, "%Y-%m-%d %H:%M:%S")
    dt_utc = dt.replace(tzinfo=timezone.utc)
    timestamp_ms = int(dt_utc.timestamp() * 1000)
    response = scan(es_client, query = {"query":{"query_string":{"query": "metadata.startdate:>=" + str(timestamp_ms)}}}, index=index)
    count = 0
    for r in response:
        count += 1
    return f"There are {count} documents in index {index} after start date {start_date}."
tool_list.append(count_afterstartdate_string_tool)

@tool("count_afterupdatedate_tool", parse_docstring=True)
def count_afterupdatedate_tool(update_date: int) ->  str:
    """
    Useful for counting documents in the Elasticsearch index pgr-monitorai-testing that have been updated last after a given update date. Input should be a natural language query with one parameter, the update date in the epoch or integer format.

    Args:
        update_date: The date in integer or epoch format, by which we will filter the applications to get a count of all applications last updated after this date
    """
    response = scan(es_client, query = {"query":{"query_string":{"query": "metadata.updatedtime:>=" + str(update_date)}}}, index=index)
    count = 0
    for r in response:
        count += 1
    return f"There are {count} documents in index {index} after update date {str(update_date)}."
tool_list.append(count_afterupdatedate_tool)

@tool("count_afterupdatedate_string_tool", parse_docstring=True)
def count_afterupdatedate_string_tool(update_date: str) ->  str:
    """
    Useful for counting documents in the Elasticsearch index pgr-monitorai-testing that have been updated last after a given update date. Input should be a natural language query with one parameter, the update date in a textual (%Y-%m-%d %H:%M:%S) format.

    Args:
        update_date: The date in textual (%Y-%m-%d %H:%M:%S) format, by which we will filter the applications to get a count of all applications last updated after this date
    """
    dt = datetime.strptime(update_date, "%Y-%m-%d %H:%M:%S")
    dt_utc = dt.replace(tzinfo=timezone.utc)
    timestamp_ms = int(dt_utc.timestamp() * 1000)
    response = scan(es_client, query = {"query":{"query_string":{"query": "metadata.updatedtime:>=" + str(timestamp_ms)}}}, index=index)
    count = 0
    for r in response:
        count += 1
    return f"There are {count} documents in index {index} after update date {update_date}."
tool_list.append(count_afterupdatedate_string_tool)

@tool("count_afterassigndate_tool", parse_docstring=True)
def count_afterassigndate_tool(assign_date: int) ->  str:
    """
    Useful for counting documents in the Elasticsearch index pgr-monitorai-testing that have been assigned to be completed after a given assign date. Input should be a natural language query with one parameter, the assign date in the epoch or integer format.

    Args:
        assign_date: The date in integer or epoch format, by which we will filter the applications to get a count of all applications assigned to be completed after this date
    """
    response = scan(es_client, query = {"query":{"query_string":{"query": "metadata.assignedtime:>=" + str(assign_date)}}}, index=index)
    count = 0
    for r in response:
        count += 1
    return f"There are {count} documents in index {index} after assign date {str(assign_date)}."
tool_list.append(count_afterassigndate_tool)

@tool("count_afterassigndate_string_tool", parse_docstring=True)
def count_afterassigndate_string_tool(assign_date: str) ->  str:
    """
    Useful for counting documents in the Elasticsearch index pgr-monitorai-testing that have been assigned to be completed after a given assign date. Input should be a natural language query with one parameter, the assign date in a textual (%Y-%m-%d %H:%M:%S) format.

    Args:
        assign_date: The date in textual (%Y-%m-%d %H:%M:%S) format, by which we will filter the applications to get a count of all applications assigned to be completed after this date
    """
    dt = datetime.strptime(assign_date, "%Y-%m-%d %H:%M:%S")
    dt_utc = dt.replace(tzinfo=timezone.utc)
    timestamp_ms = int(dt_utc.timestamp() * 1000)
    response = scan(es_client, query = {"query":{"query_string":{"query": "metadata.assignedtime:>=" + str(timestamp_ms)}}}, index=index)
    count = 0
    for r in response:
        count += 1
    return f"There are {count} documents in index {index} after assign date {assign_date}."
tool_list.append(count_afterassigndate_string_tool)

@tool("count_afterresolveddate_tool", parse_docstring=True)
def count_afterresolveddate_tool(resolved_date: int) ->  str:
    """
    Useful for counting documents in the Elasticsearch index pgr-monitorai-testing that have been resolved after a given resolved date. Input should be a natural language query with one parameter, the resolved date in the epoch or integer format.

    Args:
        resolved_date: The date in integer or epoch format, by which we will filter the applications to get a count of all applications resolved after this date
    """
    response = scan(es_client, query = {"query":{"query_string":{"query": "metadata.resolvetime:>=" + str(resolved_date)}}}, index=index)
    count = 0
    for r in response:
        count += 1
    return f"There are {count} documents in index {index} after resolved date {str(resolved_date)}."
tool_list.append(count_afterresolveddate_tool)

@tool("count_afterresolveddate_string_tool", parse_docstring=True)
def count_afterresolveddate_string_tool(resolved_date: str) ->  str:
    """
    Useful for counting documents in the Elasticsearch index pgr-monitorai-testing that have been resolved after a given resolved date. Input should be a natural language query with one parameter, the resolved date in a textual (%Y-%m-%d %H:%M:%S) format.

    Args:
        resolved_date: The date in textual (%Y-%m-%d %H:%M:%S) format, by which we will filter the applications to get a count of all applications resolved after this date
    """
    dt = datetime.strptime(resolved_date, "%Y-%m-%d %H:%M:%S")
    dt_utc = dt.replace(tzinfo=timezone.utc)
    timestamp_ms = int(dt_utc.timestamp() * 1000)
    response = scan(es_client, query = {"query":{"query_string":{"query": "metadata.resolvetime:>=" + str(timestamp_ms)}}}, index=index)
    count = 0
    for r in response:
        count += 1
    return f"There are {count} documents in index {index} after resolved date {resolved_date}."
tool_list.append(count_afterresolveddate_string_tool)

@tool("count_afterreopeneddate_tool", parse_docstring=True)
def count_afterreopeneddate_tool(reopened_date: int) ->  str:
    """
    Useful for counting documents in the Elasticsearch index pgr-monitorai-testing that have been reopened after a given reopened date. Input should be a natural language query with one parameter, the reopened date in the epoch or integer format.

    Args:
        reopened_date: The date in integer or epoch format, by which we will filter the applications to get a count of all applications reopened after this date
    """
    response = scan(es_client, query = {"query":{"query_string":{"query": "metadata.reopentime:>=" + str(reopened_date)}}}, index=index)
    count = 0
    for r in response:
        count += 1
    return f"There are {count} documents in index {index} after update date {str(reopened_date)}."
tool_list.append(count_afterreopeneddate_tool)

@tool("count_afterreopeneddate_string_tool", parse_docstring=True)
def count_afterreopeneddate_string_tool(reopened_date: str) ->  str:
    """
    Useful for counting documents in the Elasticsearch index pgr-monitorai-testing that have been reopened after a given reopened date. Input should be a natural language query with one parameter, the reopened date in a textual (%Y-%m-%d %H:%M:%S) format.

    Args:
        reopened_date: The date in textual (%Y-%m-%d %H:%M:%S) format, by which we will filter the applications to get a count of all applications reopened after this date
    """
    print(reopened_date)
    dt = datetime.strptime(reopened_date, "%Y-%m-%d %H:%M:%S")
    dt_utc = dt.replace(tzinfo=timezone.utc)
    timestamp_ms = int(dt_utc.timestamp() * 1000)
    print(timestamp_ms)
    
    response = scan(es_client, query = {"query":{"query_string":{"query": "metadata.reopentime:>=" + str(timestamp_ms)}}}, index=index)
    count = 0
    for r in response:
        count += 1
    return f"There are {count} documents in index {index} after update date {reopened_date}."
tool_list.append(count_afterreopeneddate_string_tool)

@tool("count_reopened_tool", parse_docstring=True)
def count_reopened_tool() ->  str:
    """
    Useful for counting documents in the Elasticsearch index pgr-monitorai-testing that are currently reopened and not resolved again. Input should be a natural language query with no parameters.
    """
    response = scan(es_client, query = {"query":{"constant_score":{"filter": {"exists": {"field": "metadata.resolvetime"}}}}}, index=index)
    count = 0.0
    for r in response:
        c = r["_source"]["metadata"]
        if int(c["reopentime"])>int(c["resolvetime"]):
            count+=1
    return f"There are {count} documents in index {index} that are currently reopened."
tool_list.append(count_reopened_tool)

@tool("count_reopened_incity_tool", parse_docstring=True)
def count_reopened_incity_tool(city: str) ->  str:
    """
    Useful for counting documents in the Elasticsearch index pgr-monitorai-testing that are currently reopened and not resolved again within a certain city given as input. Input should be a natural language query with one parameter, the city for which we need the count.

    Args:
        city: City by which we will filter the documents in the index
    """
    response = scan(es_client, query = {"query": {"constant_score": {"filter": {"bool": {"must": [{"exists": {"field": "metadata.resolvetime"}}, {"query_string": {"query": f"metadata.city:{city}"}}]}}}}}, index=index)
    count = 0.0
    for r in response:
        c = r["_source"]["metadata"]
        if int(c["reopentime"])>int(c["resolvetime"]):
            count+=1
    return f"There are {count} documents in index {index} that are currently reopened."
tool_list.append(count_reopened_incity_tool)

@tool("count_reopened_incity_formohallas_tool", parse_docstring=True)
def count_reopened_incity_formohallas_tool(city: str) ->  str:
    """
    Useful for enumerating documents in the Elasticsearch index pgr-monitorai-testing that are currently reopened and not resolved again within a certain city given as input. This will also provide a disambiguation of the count against the areas or localities or mohallas in the ity. Input should be a natural language query with one parameter, the city for which we need the disambiguation.

    Args:
        city: City by which we will filter the documents in the index
    """
    response = scan(es_client, query = {"query": {"constant_score": {"filter": {"bool": {"must": [{"exists": {"field": "metadata.resolvetime"}}, {"query_string": {"query": f"metadata.city:{city}"}}]}}}}}, index=index)
    count = 0.0
    mohalla_dict = {}
    for r in response:
        c = r["_source"]["metadata"]
        if int(c["reopentime"])>int(c["resolvetime"]):
            if c["mohalla"] not in mohalla_dict:
                mohalla_dict[c["mohalla"]] = 0
            mohalla_dict[c["mohalla"]] += 1
            count+=1
    ret_str = f"For city {city}, the following are the mohallas:\n"
    for k, v in mohalla_dict.items():
        ret_str += f"{k}, count is: {v}\n"
    return ret_str
tool_list.append(count_reopened_incity_formohallas_tool)

@tool("closure_rate", parse_docstring=True)
def closure_rate() ->  str:
    """
    Useful for calculating a closure rate, that is the ratio of closed applications to total received applications, in the index pgr-monitorai-testing. Input should be a natural language query with no parameters.
    """
    response = scan(es_client, query = {"query":{}}, index=index)
    total_count = 0.0
    closure_count = 0.0
    for r in response:
        c = r["_source"]["metadata"]
        if (c["reopentime"] and c["resolvetime"] and int(c["reopentime"])<int(c["resolvetime"])) or c["resolvetime"]:
            closure_count += 1
        total_count += 1
    closure = closure_count/total_count
    return f"The closure rate across the index is {closure}"
tool_list.append(closure_rate)

@tool("closure_rate_incity", parse_docstring=True)
def closure_rate_incity(city: str) ->  str:
    """
    Useful for calculating a closure rate, that is the ratio of closed applications to total received applications, in the index pgr-monitorai-testing for a given city. Input should be a natural language query with one parameter, the city for which the closure rate needs to be calculated.

    Args:
        city: City by which we will filter the documents in the index
    """
    response = scan(es_client, query = {"query":{"query_string": {"query": "metadata.city:"+city}}}, index=index)
    total_count = 0.0
    closure_count = 0.0
    for r in response:
        c = r["_source"]["metadata"]
        if (c["reopentime"] and c["resolvetime"] and int(c["reopentime"])<int(c["resolvetime"])) or c["resolvetime"]:
            closure_count += 1
        total_count += 1
    closure = closure_count/total_count
    return f"The closure rate in city {city} is {closure}"
tool_list.append(closure_rate_incity)

@tool("average_resolution_time", parse_docstring=True)
def average_resolution_time() ->  str:
    """
    Useful for calculating an averaged application resolution time, that is the average of difference between resolution time and assigned time, in the index pgr-monitorai-testing. Input should be a natural language query with no parameters.
    """
    response = scan(es_client, query = {"query": {"constant_score":{"filter": {"exists": {"field": "metadata.resolvetime"}}}}}, index=index)
    total_count = 0.0
    resolution_time = 0.0
    for r in response:
        c = r["_source"]["metadata"]
        if (c["reopentime"] and c["resolvetime"] and int(c["reopentime"])<int(c["resolvetime"])):
            resolution_time += int(c["resolvetime"])-int(c["reopentime"])
            total_count += 1
        elif c["resolvetime"]:
            resolution_time += int(c["resolvetime"])-int(c["assignedtime"])
            total_count += 1
    resolution_time = resolution_time/total_count
    resolution_time /= 1000*60*60*24
    return f"The average resolution time across the index is {resolution_time} days"
tool_list.append(average_resolution_time)

@tool("average_resolution_time_incity", parse_docstring=True)
def average_resolution_time_incity(city: str) ->  str:
    """
    Useful for calculating a closure rate, that is the ratio of closed applications to total received applications, in the index pgr-monitorai-testing for a given city. Input should be a natural language query with one parameter, the city for which the closure rate needs to be calculated.

    Args:
        city: City by which we will filter the documents in the index
    """
    response = scan(es_client, query = {"query": {"constant_score": {"filter": {"bool": {"must": [{"exists": {"field": "metadata.resolvetime"}}, {"query_string": {"query": f"metadata.city:{city}"}}]}}}}}, index=index)
    total_count = 0.0
    resolution_time = 0.0
    for r in response:
        c = r["_source"]["metadata"]
        if (c["reopentime"] and c["resolvetime"] and int(c["reopentime"])<int(c["resolvetime"])):
            resolution_time += int(c["resolvetime"])-int(c["reopentime"])
            total_count += 1
        elif c["resolvetime"]:
            resolution_time += int(c["resolvetime"])-int(c["assignedtime"])
            total_count += 1
    resolution_time = resolution_time/total_count
    resolution_time /= 1000*60*60*24
    return f"The average resolution time in city {city} is {resolution_time} days"
tool_list.append(average_resolution_time_incity)

@tool("escalation_rate", parse_docstring=True)
def escalation_rate() ->  str:
    """
    Useful for calculating a escalation rate, that is the ratio of reopened applications to total received applications, in the index pgr-monitorai-testing. Input should be a natural language query with no parameters.
    """
    response = scan(es_client, query = {}, index=index)
    total_count = 0.0
    escalation_count = 0.0
    for r in response:
        c = r["_source"]["metadata"]
        if c["reopentime"]:
            escalation_count += 1
        total_count += 1
    escalation = escalation_count/total_count
    return f"The escalation rate across the index is {escalation}"
tool_list.append(escalation_rate)

@tool("escalation_rate_incity", parse_docstring=True)
def escalation_rate_incity(city: str) ->  str:
    """
    Useful for calculating an escalation rate, that is the ratio of reopened applications to total received applications, in the index pgr-monitorai-testing for a given city. Input should be a natural language query with one parameter, the city for which the escalation rate needs to be calculated.

    Args:
        city: City by which we will filter the documents in the index
    """
    response = scan(es_client, query = {"query":{"query_string": {"query": "metadata.city:"+city}}}, index=index)
    total_count = 0.0
    escalation_count = 0.0
    for r in response:
        c = r["_source"]["metadata"]
        if c["reopentime"]:
            escalation_count += 1
        total_count += 1
    escalation = escalation_count/total_count
    return f"The escalation rate in city {city} is {escalation}"
tool_list.append(escalation_rate_incity)

@tool("active_issues_incity", parse_docstring=True)
def active_issues_incity(city: str) ->  str:
    """
    Useful for counting how many of each kind of issue (or service) has been logged and is currently active in the Elasticsearch index pgr-monitorai-testing for a specific city. Input should be a natural language query with one parameter, the name of the city.

    Args:
        city: City by which we will filter the documents in the index
    """
    response = scan(es_client, query = {"_source": {"exclude": ["vector"]}, "query": {"query_string":{"query": "(metadata.city:" + city + ")"}}}, index=index)
    counter_dict = {}
    for r in response:
        print(r)
        if r["_source"]["metadata"]["servicecode"] not in counter_dict:
            counter_dict[r["_source"]["metadata"]["servicecode"]] = 0.0
        if not r["_source"]["metadata"]["resolvetime"] or (r["_source"]["metadata"]["resolvetime"] and r["_source"]["metadata"]["reopentime"] and r["_source"]["metadata"]["reopentime"]<r["_source"]["metadata"]["resolvetime"]):
            counter_dict[r["_source"]["metadata"]["servicecode"]] += 1.0
    ret_str = f"For city {city}, the following are the issues:\n"
    for k, v in counter_dict.items():
        ret_str += f"{k}: {v} counts\n"
    return ret_str
tool_list.append(active_issues_incity)

@tool("active_issues_inmohalla_incity", parse_docstring=True)
def active_issues_inmohalla_incity(city: str) ->  str:
    """
    Useful for counting how many kinds of issues have been logged and is currently active in the Elasticsearch index pgr-monitorai-testing for a specific mohallas (or localities or areas) in a specific city. Input should be a natural language query with one parameter, the name of the city.

    Args:
        city: City by which we will filter the documents in the index
    """
    response = scan(es_client, query = {"_source": {"exclude": ["vector"]}, "query": {"query_string":{"query": "(metadata.city:" + city + ")"}}}, index=index)
    counter_dict = {}
    for r in response:
        print(r)
        if r["_source"]["metadata"]["mohalla"] not in counter_dict:
            counter_dict[r["_source"]["metadata"]["mohalla"]] = {}
        if r["_source"]["metadata"]["servicecode"] not in counter_dict[r["_source"]["metadata"]["mohalla"]]:
            counter_dict[r["_source"]["metadata"]["mohalla"]][r["_source"]["metadata"]["servicecode"]] = 0.0
        if not r["_source"]["metadata"]["resolvetime"] or (r["_source"]["metadata"]["resolvetime"] and r["_source"]["metadata"]["reopentime"] and r["_source"]["metadata"]["reopentime"]<r["_source"]["metadata"]["resolvetime"]):
            counter_dict[r["_source"]["metadata"]["mohalla"]][r["_source"]["metadata"]["servicecode"]] += 1.0
    ret_str = f"For city {city}, the following are the mohallas:\n"
    for k, v in counter_dict.items():
        ret_str += f"{k}, issues are: \n"
        for k2, v2 in v.items():
            ret_str += f"{k2}: {v2} counts\n"
    return ret_str
tool_list.append(active_issues_inmohalla_incity)

# print(len(tool_list))

memory = ConversationBufferMemory(memory_key="chat_history", return_messages=True) # Memory module that did not work

llm = OpenAI(temperature=0) # LLM

agent = initialize_agent( # Agent, given the LLM and the lsit of tools
    tools=tool_list,
    llm=llm,
    agent=AgentType.STRUCTURED_CHAT_ZERO_SHOT_REACT_DESCRIPTION,
    verbose=True
)

# Added this for memory, though the memory module did not work. This has slightly different syntax than if you just use the agent
agent_executor = AgentExecutor.from_agent_and_tools(
    agent=agent.agent,
    tools=tool_list,
    memory=memory,
    verbose=True,
)

# memory = []

# Streamlit UI code
if prompt := st.chat_input("What is up?"):
    st.session_state.messages.append({"role": "user", "content": prompt})
    # memory.append(HumanMessage(content=prompt))
    with st.chat_message("user"):
        st.markdown(prompt) # User markdown
    with st.chat_message("assistant"):
        response = agent_executor.run(prompt) # ["output"]
        st.markdown(response) # Agent markdown
    st.session_state.messages.append({"role": "assistant", "content": response})
    # memory.append(AIMessage(content=prompt))