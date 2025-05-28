import getpass
import os

from langchain_core.documents import Document
from langchain_elasticsearch import ElasticsearchStore
from langchain_openai import OpenAIEmbeddings, OpenAI
from langchain.chains.query_constructor.schema import AttributeInfo
from langchain.retrievers.self_query.base import SelfQueryRetriever
from langchain_core.runnables import RunnableLambda, RunnablePassthrough
from langchain_core.output_parsers import StrOutputParser
from elasticsearch import Elasticsearch

if "OPENAI_API_KEY" not in os.environ:
    os.environ["OPENAI_API_KEY"] = getpass.getpass("OpenAI API Key:")

embeddings = OpenAIEmbeddings()

es = Elasticsearch(
    "https://unified-dev-monitorai.digit.org/",
    basic_auth=("dummy", "dummy"),
    # connection_class=RequestsHttpConnection,
    verify_certs=False,
    # compatibility_mode=True,
    headers={"Accept": "application/json", "Content-Type": "application/json"}
)

es.indices.delete(index='pgr-monitorai-testing', ignore=[400, 404])

with open("input-data.csv") as fp:
    lines = fp.readlines()
columns = lines[0].split(",")
lines = lines[1:]

docs = []

for line in lines:
    doc = {}
    ll = line.split(",")
    for i in range(len(columns)):
        doc[columns[i].strip()]=ll[i].strip()
    docs.append(Document(page_content=doc["applicationid"], metadata=doc))

# docs = [
#     Document(
#         page_content="A bunch of scientists bring back dinosaurs and mayhem breaks loose",
#         metadata={"year": 1993, "rating": 7.7, "genre": "science fiction"},
#     ),
#     Document(
#         page_content="Leo DiCaprio gets lost in a dream within a dream within a dream within a ...",
#         metadata={"year": 2010, "director": "Christopher Nolan", "rating": 8.2},
#     ),
#     Document(
#         page_content="A psychologist / detective gets lost in a series of dreams within dreams within dreams and Inception reused the idea",
#         metadata={"year": 2006, "director": "Satoshi Kon", "rating": 8.6},
#     ),
#     Document(
#         page_content="A bunch of normal-sized women are supremely wholesome and some men pine after them",
#         metadata={"year": 2019, "director": "Greta Gerwig", "rating": 8.3},
#     ),
#     Document(
#         page_content="Toys come alive and have a blast doing so",
#         metadata={"year": 1995, "genre": "animated"},
#     ),
#     Document(
#         page_content="Three men walk into the Zone, three men walk out of the Zone",
#         metadata={
#             "year": 1979,
#             "director": "Andrei Tarkovsky",
#             "genre": "science fiction",
#             "rating": 9.9,
#         },
#     ),
# ]

vectorstore = ElasticsearchStore(
    embedding = embeddings,
    index_name="pgr-monitorai-testing",
    es_url="https://unified-dev-monitorai.digit.org/",
    es_user="dummy",
    es_password="dummy"
)

for i in range(0, len(docs), 25):
    try:
        batch = docs[i:i+25]
    except Exception:
        batch = docs[i:]
    vectorstore.add_documents(batch)

metadata_field_info = [
    AttributeInfo(
        name="city",
        description="The city from which the application or request was posted.",
        type="string",
    ),
    AttributeInfo(
        name="module",
        description="The module in the code that took this application or request.",
        type="string",
    ),
    AttributeInfo(
        name="application",
        description="The type of application or request that was received by the system.",
        type="string",
    ),
    AttributeInfo(
        name="applicationid",
        description="The unique ID of the application or request submitted.",
        type="string",
    ),
    AttributeInfo(
        name="channel",
        description="The channel (or the platform or app) by which the application or request was received.",
        type="string",
    ),
    AttributeInfo(
        name="startdate",
        description="The date and time on which the processing of the application or request began, provided as a unix timestamp.",
        type="integer",
    ),
    AttributeInfo(
        name="updatedtime",
        description="The date and time on which the processing of the application or request was updated last, provided as a unix timestamp.",
        type="integer",
    ),
    AttributeInfo(
        name="currentstatus",
        description="The current status of the application.",
        type="string",
    ),
    AttributeInfo(
        name="mohalla",
        description="The area, locality or \"mohalla\" from where the application or request was filed.",
        type="string",
    ),
    AttributeInfo(
        name="servicecode",
        description="The service code assigned to the application or request, providing information on what kind of problem needs to be resolved. Provided in CamelCase.",
        type="string",
    ),
    AttributeInfo(
        name="assignedtime",
        description="The time in unix timestamp when the application or request was assigned to someone to address.",
        type="integer",
    ),
    AttributeInfo(
        name="resolvetime",
        description="The time in unix timestamp when the application or request was resolved by the person or persons it was assigned to. This field is null if the issue has not yet been resolved.",
        type="integer",
    ),
    AttributeInfo(
        name="reopentime",
        description="The time in unix timestamp when the application or request was last reopened (likely because it wasn't resolved well the first time). If the issue was closed successfully, this field is null.",
        type="integer",
    )
]

# def inspect(state):
#     """Print the state passed between Runnables in a langchain and pass it on"""
#     print(state)
#     return state

document_content_description = "An application or request received by the system. In general this is a system that addresses grievances of certain types, so the applications are all for grievance redressal."
llm = OpenAI(temperature=0)
retriever = SelfQueryRetriever.from_llm(
    llm, vectorstore, document_content_description, metadata_field_info, verbose=True
)

# chain = (
#     {"context": retriever, "question": RunnablePassthrough()}
#     | RunnableLambda(inspect)  # Add the inspector here to print the intermediate results
#     | "In the city of Adampur, are there any applications filed via whatsapp?"
#     | llm
#     | StrOutputParser()
# )

# print(retriever.invoke("What are some movies about dinosaurs"))
# # print(retriever.invoke("Has Greta Gerwig directed any movies about women"))

print(retriever.invoke("How many grievances have been logged in the system for Amloh city?"))
print()
print(retriever.invoke("In the city of Adampur, are there any applications filed via whatsapp?"))
print()
print(retriever.invoke("In the city of Ahmedgarh, are there any applications requesting damaged roads be fixed?"))