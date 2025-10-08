import os
import re
import torch
import textwrap
import fitz 
from tqdm.auto import tqdm
import random, textwrap
import pandas  as pa
from huggingface_hub import login   

from sentence_transformers import util, SentenceTransformer
from sklearn.metrics.pairwise import cosine_similarity
import numpy as np
import nltk
from spacy.lang.en import English
from transformers import AutoTokenizer, AutoModelForCausalLM
from transformers.utils import is_flash_attn_2_available

device = "cpu" if torch.backends.mps.is_available() else "cpu"

attn_implementation='sdpa'
print(f"[INFO] Using attention implementation: {attn_implementation}")
if torch.backends.mps.is_available():
    device = torch.device("cpu")
    print("✅")
else:
    device = torch.device("cpu")
    print("⚠️ Falling back to CPU")

model_id = "google/gemma-3-1b-it"

# Use environment variable for HuggingFace token (optional)
# Set HF_TOKEN environment variable or use huggingface-cli login
hf_token = os.getenv("HF_TOKEN", None)

if hf_token:
    from huggingface_hub import login
    login(token=hf_token)

tokenizer = AutoTokenizer.from_pretrained(
    model_id,
    token=hf_token,
    device_map=device
)

llm_model = AutoModelForCausalLM.from_pretrained(
    model_id,
    low_cpu_mem_usage=True,
    device_map=device,
    token=hf_token,
    trust_remote_code=True,
    dtype=torch.float32,
    use_safetensors=True,
    revision="main",
    attn_implementation=attn_implementation
)



nlp = English()

nlp.add_pipe("sentencizer")

embedding_model = SentenceTransformer(model_name_or_path="all-mpnet-base-v2", device=device)  

sentences = [ 
    "The Sentences Transformer is a great model for embedding sentences.",
    "It can be used for various NLP tasks such as semantic search and clustering.",
    "This is an example sentence to demonstrate its capabilities."
    "The quick brown fox jumps over the lazy dog."
 ]

embeddings = embedding_model.encode(sentences)
embeddings_dict = dict(zip(sentences, embeddings))



# for sentence, embedding in embeddings_dict.items():
#     print(f"Sentence: {sentence}\
#           nEmbedding: {embedding}... (truncated)\n")

#     print("----")
# print(len(embeddings_dict))  

doc=    nlp("This is a sentence. This is another sentence.")
assert len(list(doc.sents)) == 2
(list(doc.sents))

nltk.download('punkt', quiet=True)
nltk.download("punkt_tab")

if "COLAB_GPU" in os.environ:
    print("Running in Google Colab with GPU support.")
else:
    print("Running locally.")
pdf_path = 'human-nutrition-text.pdf'

# Now you can import and use the libraries
if(not os.path.exists(pdf_path)):
    print("PDF not exists...")
else:
    print("PDF exists...")



semantic_model = SentenceTransformer('all-mpnet-base-v2')
def semantic_chunk_text(text: str, similarity_threshold: float = 0.8, max_tokens: int = 500) -> list:
    """Splits text into semantic chunks based on sentence similarity and max tojen length ."""
    sentences = nltk.sent_tokenize(text)
    if not sentences:
        return []
    embeddings = semantic_model.encode(sentences)
    chunks = []
    current_chunk = [sentences[0]]
    current_embedding = embeddings[0]

    for i in range(1, len(sentences)):
        sim = cosine_similarity([current_embedding], [embeddings[i]])[0][0]
        chunk_token_count = len((" ".join(current_chunk) + " " + sentences[i]).split()) // 4
        if sim >= similarity_threshold and chunk_token_count <= max_tokens:
            current_chunk.append(sentences[i])
            current_embedding = np.mean([current_embedding, embeddings[i]], axis=0)
        else:
            chunks.append( " " .join( current_chunk))
            current_chunk = [sentences[i]]
            current_embedding = embeddings[i]

        if current_chunk:
            chunks.append( " " .join( current_chunk))
    return chunks

# checking the file exists or not is done 
    
def text_formatter(text: str) -> str:
    """Performs basic text formatting."""
    if not text:
        return ""
    # Replace newlines with spaces and collapse multiple spaces
    cleaned_text = text.replace("\n", " ").strip()
    return cleaned_text 



     # Ensure to return the formatted text
def open_and_read_pdf(pdf_path: str) -> str:
    """Opens and reads a PDF file, returning its text content."""
    document = fitz.open(pdf_path)
    pages_and_texts = []
    for page_number, page in tqdm(enumerate(document)):
        text = page.get_text()
        text = text_formatter(text)
        pages_and_texts.append({
            "page_number": page_number - 24,
            "page_Char_count": len(text),
            "page_word_count": len(text.split(" ")),
            "page_sentance_count_raw": len(text.split('. ')),
            "page_token_count": len(text) / 4,  # Rough estimate: 1 token ~ 4 characters
            "text": text
        })
    return pages_and_texts


pages_and_texts = open_and_read_pdf(pdf_path = pdf_path)
print(pages_and_texts[:2])
print(random.sample(pages_and_texts, k=3))
df = pa.DataFrame(pages_and_texts)
print(df.head())
print(df.describe().round(2))




def chunk_text(text: str, chunk_size: int = 500) -> list:
    """Chunks text into smaller pieces with specified size."""
    chunks = []
    current_chunk = ""
    words = text.split()

    for word in words:
        # If adding the next word keeps chunk under size
        if len(current_chunk) + len(word) + 1 <= chunk_size:
            current_chunk += (word + ' ')
        else:
            chunks.append(current_chunk.strip())
            current_chunk = word + ' '

    if current_chunk:  # add leftover chunk
        chunks.append(current_chunk.strip())

    return chunks

def chuck_pdf_pages(pages_and_texts: list, chunk_size: int = 500) -> list[dict]:
    """Chunks text from each page of the PDF."""
    all_chunks = []
    for page in pages_and_texts:
        page_number = page["page_number"]
        text = page["text"]

        chunks = chunk_text(text, chunk_size=chunk_size)
        # chunks = semantic_chunk_text(text, similarity_threshold=0.75, max_tokens=chunk_size)
        for i, chunk in  enumerate(chunks):
            all_chunks.append({
                "page_number": page_number,
                "chunk_index": i,
                "chunk_char_count": len(chunk),
                "chunk_word_count": len(chunk.split()),
                "chunk_token_count": len(chunk)/4,
                "chunk_text": chunk,  # Rough estimate
            }) 
    return all_chunks
chunked_pages = chuck_pdf_pages(pages_and_texts, chunk_size=500)
print(f"Total chunks created: {len(chunked_pages)}")


def _scattered_indices(n:int, k:int, jitter_frac: float =0.08) -> list[int]:
    """Evenly spaced anchors  + random jitter -> indices scattered across [0, n-1]."""
    if k<=0:
        return []
    if k == 1:
        return [random.randrange(n)]
    anchors = [round(i * (n - 1) / (k - 1)) for i in range(k)]
    out, seen = [], set()
    radius = max(2, round(jitter_frac * n))
    for a in anchors:
       lo, hi = max(0, a - radius), min(n - 1, a + radius)
       j=  random.randint(lo, hi)
       if j not in seen:
           out.append(j); seen.add(j)
    while len(out) < k:
        j = random.randrange(n)
        if j not in seen:
            out.append(j); seen.add(j)
    return out    




def _draw_boxed_chunk(c: dict, wrap_at: int= 96) -> str:
    # header =( f" Chunk p {c['page_number']} . idx: {c['chunk_index']}  | "
    # f"words  {c['chunk_word_count']} | Chars: {c['chunk_char_count']} . ~ Tokens: {c['chunk_token_count']:.1f} " \
    #     )
    header = (f" Chapters {c['chapter_index']} |  {c['title'[:120]]} "
              f"| p: {c['page_start']}-{c['page_end']} | ~ Tokens: {c['chunk_token_count']} ")

    wrapped_lines = textwrap.wrap(c['chunk_text'], width=wrap_at, break_long_words=False, replace_whitespace=False)
    content_width = max(len(line) for line in wrapped_lines)
    box_width = max(len(header), content_width + 2)   # +2 for padding
    top = "╔" + "═" * box_width + "╗"
    hline = "╟" + "─" * box_width + "╢"
    sep = "╠" + "═" * box_width + "╣"
    body = "\n".join(f"║ {line.ljust(box_width - 2)} ║" for line in wrapped_lines)
    bottom= "╚" + "═" * box_width + "╝"
    return "\n".join([top, f"║{header.center(box_width)}║", hline, body, sep, bottom])

def show_random_chunks(pages_and_texts: list, chunk_size: int = 500, k: int= 5, seed: int | None = 42):
    if seed is not None:
        random.seed(seed)
    all_chunks = chuck_pdf_pages(pages_and_texts, chunk_size)
    if not all_chunks:
        print("No chunks available to display.")
        return
    idxs = _scattered_indices(len(all_chunks), k)
    print(f"Showing {len(idxs)} random chunks (out of {len(all_chunks)} total):\n")
    for i , idx in enumerate(idxs, 1):
        print(f"--- Chunk {i} / {len(idxs)} ---")
        print(_draw_boxed_chunk(all_chunks[idx]))
        print()

def show_random_chapter_chunks(chapter_chunks: list[dict], k: int=5, seed: int | None =42):
    if not chapter_chunks:
        print("No chapter chunks available to display.")
        return
    if seed is not None:
        random.seed(seed)
    k = min(k, len(chapter_chunks))
    idxs = random.sample(range(len(chapter_chunks)), k)
    print(f"Showing {len(idxs)} random chapter chunks (out of {len(chapter_chunks)} total):\n")
    for i, idx in enumerate(idxs, 1):
        print(f"#{i}")
        print(_draw_boxed_chunk(chapter_chunks[idx]))
        print()




# assert 'pages_and_texts' in globals(), "pages_and_texts not defined. Run the PDF reading code first." 
# show_random_chunks(pages_and_texts, chunk_size=500, k=5, seed=42)


# section based chunking 
def _is_chapter_header_page(text:str) -> bool:
    return re.search(r"university\s+of\s+hawai", text, flags=re.IGNORECASE) is not None

def _guess_title_from_page(text: str) ->str:
    """Best-efffort chaper title  guess  = the text before the 'University of Hawai' header line
    Falls back to the first ~120 characters.
    """
    m = re.search(r"university\s+of\s+hawai", text, flags=re.IGNORECASE)
    if m:
        title = text[:m.start()].strip()
        #Keep it readable
        title = re.sub(r"\s+", " ", title).strip()
        if 10 <= len(title) <= 180:
            return title
    #Fallback
    t = re.sub(r"\s+", " ", text).strip()
    return t[:120] if t else  "Untitled Chapter"  

def chapter_chunk_pdf_pages(pages_and_texts: list[dict]) -> list[dict]:
# Finalize last chapter
  """
  Returns a list of chunks with chapter titles included.
  [
  {
  'chapter_index' : int,
  'title' : str,
  'page_start' : int,
  'page_end' : int,
   'chunk_char_count' : int,
    'chunk_word_count' : int,
    'chunk_token_count' : float,
    'chunk_text' : str
  },....
  ]
  """


  if not pages_and_texts:
      return []
  
  chapter_starts =[]
  for i, p in enumerate(pages_and_texts):
      txt = p["text"]
      if _is_chapter_header_page(txt):
          chapter_starts.append(i)

  if not chapter_starts:
      
      all_text = " ".join(p["text"] for p in pages_and_texts).strip()

      return [{
          "chapter_index": 0, 
          "title": _guess_title_from_page(pages_and_texts[0]["text"]),
          "page_start": pages_and_texts[0]["page_number"],
          "page_end": pages_and_texts[-1]["page_number"],
          "chunk_char_count": len(all_text),
          "chunk_word_count": len(all_text.split()),
          "chunk_token_count": round(len(all_text)/4,2),
          "chunk_text": all_text
      }]
  
  chapter_chunks = []


  for ci, s in enumerate(chapter_starts):

      e =(chapter_starts[ci + 1] - 1) if (ci + 1 < len(chapter_starts)) else (len(pages_and_texts) -1)
      
      if e < s:
        continue
      

      pages = pages_and_texts[s:e + 1]
  
      text_concat = " ".join(p["text"] for p in pages).strip()
      title = _guess_title_from_page(pages[0]["text"])   # FIXED

      chapter_chunks.append({
        "chapter_index": ci,
        "title": title,
        "page_start": pages[0]["page_number"],
        "page_end":  pages[-1]["page_number"],
        "chunk_char_count": len(text_concat),
        "chunk_word_count": len(text_concat.split()),
        "chunk_token_count": round(len(text_concat)/4, 2),
        "chunk_text": text_concat
    })
      
 
    
  return chapter_chunks  
 # FIXED (moved outside loop)

structure_chunked_pages = chapter_chunk_pdf_pages(pages_and_texts)

for item in tqdm(pages_and_texts):
    item["sentences"]= list(nlp(item["text"]).sents)

    item["sentences"] = [str(sentence) for sentence in item["sentences"]]

    item["page_sentence_count_spacy"] = len(item["sentences"])



# print(f" Total Chapter based chunks. : {len((structure_chunked_pages))}")
# if structure_chunked_pages:
#     first = structure_chunked_pages[1]
#     print(f"First chapter chunk : {first['page_start']}-{first['page_end']}: {first['title']}... ")
#     print(first['chunk_text'][:200] + "...")
# else:
#     print("No chapter-based chunks found.")
# show_random_chapter_chunks(structure_chunked_pages, k=5, seed=42)
# print(random.sample(pages_and_texts, k=1))
df = pa.DataFrame(pages_and_texts)
print(df.describe().round(2))


num_sentence_chunk_size = 10

def split_list(input_list:list, slice_size:int) -> list[list[str]]:
    """Splits a list into smaller sublists of specified size."""
    return [input_list[i:i + slice_size] for i in range(0, len(input_list), slice_size)]

for item in tqdm(pages_and_texts):
    item["sentence_chunks"] = split_list(input_list=item["sentences"],
                                         slice_size=num_sentence_chunk_size)
    item["num_chunks"] = len(item["sentence_chunks"])


print(random.sample(pages_and_texts, k=1))


pages_and_chunks = []
for item in tqdm(pages_and_texts):
    for sentence_chunk in item["sentence_chunks"]:
        chunk_dict = {}
        chunk_dict["page_number"] = item["page_number"]

        # Join the sentences together into a paragraph-like structure, aka a chunk (so they are a single string)
        joined_sentence_chunk = "".join(sentence_chunk).replace("  ", " ").strip()
        joined_sentence_chunk = re.sub(r'\.([A-Z])', r'. \1', joined_sentence_chunk) # ".A" -> ". A" for any full-stop/capital letter combo
        chunk_dict["sentence_chunk"] = joined_sentence_chunk

        # Get stats about the chunk
        chunk_dict["chunk_char_count"] = len(joined_sentence_chunk)
        chunk_dict["chunk_word_count"] = len([word for word in joined_sentence_chunk.split(" ")])
        chunk_dict["chunk_token_count"] = len(joined_sentence_chunk) / 4 # 1 token = ~4 characters

        pages_and_chunks.append(chunk_dict)

# How many chunks do we have?
len(pages_and_chunks)

print(random.sample(pages_and_chunks, k=1))

df = pa.DataFrame(pages_and_chunks)
print(df.describe().round(2))

min_token_lenght = 30
for row in df[df["chunk_token_count"] <= min_token_lenght].sample(5).iterrows():
    print(f'Chunk token count: {row[1]["chunk_token_count"]} | Text:{row[1]["sentence_chunk"]}') 

pages_and_chunks_over_min_token_len = df[df["chunk_token_count"] > min_token_lenght].to_dict(orient="records")

print(pages_and_chunks_over_min_token_len[:2])
for item in tqdm(pages_and_chunks_over_min_token_len):
    item["embedding"]= embedding_model.encode(item["sentence_chunk"]
        )

text_chunks = [item["sentence_chunk"] for item in pages_and_chunks_over_min_token_len]

tex_chunk_embeddings = embedding_model.encode(text_chunks, batch_size=32, convert_to_tensor = True,
                                              
                                              show_progress_bar=True
    )


text_chunks_and_embeddings_df = pa.DataFrame(pages_and_chunks_over_min_token_len)
embeddings_df_save_path = "text_chunks_and_embeddings_df.csv"
text_chunks_and_embeddings_df.to_csv(embeddings_df_save_path, index=False)

text_chunks_and_embedding_df_load = pa.read_csv(embeddings_df_save_path)
text_chunks_and_embedding_df_load.head()



# Import texts and embedding df
text_chunks_and_embedding_df = pa.read_csv("text_chunks_and_embeddings_df.csv")

# Convert embedding column back to np.array (it got converted to string when it got saved to CSV)
text_chunks_and_embedding_df["embedding"] = text_chunks_and_embedding_df["embedding"].apply(lambda x: np.fromstring(x.strip("[]"), sep=" "))

# Convert texts and embedding df to list of dicts
pages_and_chunks = text_chunks_and_embedding_df.to_dict(orient="records")

# Convert embeddings to torch tensor and send to device (note: NumPy arrays are float64, torch tensors are float32 by default)
embeddings = torch.tensor(np.array(text_chunks_and_embedding_df["embedding"].tolist()), dtype=torch.float32).to(device)
print(embeddings.shape)

# print(  text_chunks_and_embeddings_df.head())
# df = pa.DataFrame(text_chunks_and_embeddings_df_load)
# print(df.describe())


# embeddings = np.vstack(text_chunks_and_embeddings_df["embedding"].values)


# 3. Get similarity scores with the dot product (we'll time this for fun)
from time import perf_counter as timer


def print_wrapped(text, width=80):
    import textwrap
    print(textwrap.fill(text, width=width))

# Loop through zipped together scores and indicies from torch.topk



def retrieve_relevant_resources(query: str,
                                embeddings: torch.tensor,
                                model: SentenceTransformer=embedding_model,
                                n_resources_to_return: int=5,
                                print_time: bool=True):
    """
    Embeds a query with model and returns top k scores and indices from embeddings.
    """

    # Embed the query
    query_embedding = model.encode(query,
                                   convert_to_tensor=True)

    # Get dot product scores on embeddings
    start_time = timer()
    dot_scores = util.dot_score(query_embedding, embeddings)[0]
    end_time = timer()

    if print_time:
        print(f"[INFO] Time taken to get scores on {len(embeddings)} embeddings: {end_time-start_time:.5f} seconds.")

    scores, indices = torch.topk(input=dot_scores,
                                 k=n_resources_to_return)

    return scores, indices

def print_top_results_and_scores(query: str,
                                 embeddings: torch.tensor,
                                 pages_and_chunks: list[dict]=pages_and_chunks,
                                 n_resources_to_return: int=5):
    """
    Takes a query, retrieves most relevant resources and prints them out in descending order.

    Note: Requires pages_and_chunks to be formatted in a specific way (see above for reference).
    """

    scores, indices = retrieve_relevant_resources(query=query,
                                                  embeddings=embeddings,
                                                  n_resources_to_return=n_resources_to_return)

    print(f"Query: {query}\n")
    print("Results:")
    # Loop through zipped together scores and indicies
    for score, index in zip(scores, indices):
        print(f"Score: {score:.4f}")
        # Print relevant sentence chunk (since the scores are in descending order, the most relevant chunk will be first)
        print_wrapped(pages_and_chunks[index]["sentence_chunk"])
        # Print the page number too so we can reference the textbook further and check the results
        print(f"Page number: {pages_and_chunks[index]['page_number']}")
        print("\n")

query = ""

# Get just the scores and indices of top related results
scores, indices = retrieve_relevant_resources(query=query,
                                              embeddings=embeddings)
scores, indices


print_top_results_and_scores(query=query,
                             embeddings=embeddings)



print(llm_model)


def get_model_num_params(model: torch.nn.Module) -> int:
    """Returns the number of parameters in a model."""
    return sum(p.numel() for p in model.parameters())

print(get_model_num_params(llm_model))

def get_model_mem_size(model: torch.nn.Module) -> float:
    mem_params = sum([param.nelement() * param.element_size() for param in model.parameters()])
    mem_buffers = sum([buf.nelement() * buf.element_size() for buf in model.buffers()])

    model_mem_bytes = mem_params + mem_buffers
    model_mem_mb = model_mem_bytes / (1024 ** 2)  # Convert to MB
    model_mem_gb = model_mem_bytes / (1024 ** 3)  # Convert to GB

    return {
        "model_mem_bytes": model_mem_bytes,
        "model_mem_mb": round(model_mem_mb,2),
        "model_mem_gb": round(model_mem_gb,2)
    }
    
print(get_model_mem_size(llm_model))

input_text = "Hi! How are you?"
print(f"Input text: {input_text}")

dialogue_template =[
    {
        "role":"user",
        "content" : input_text
    }
]


prompt =  tokenizer.apply_chat_template(conversation = dialogue_template,
                                        tokenize=False, 
                                        add_generation_prompt=True)
print(f"\nPrompt (formatted):\n{prompt}")

input_ids = tokenizer(str(prompt), return_tensors="pt").to(device)

outputs = llm_model.generate(**input_ids, max_new_tokens=256,          # <-- goes here, not in from_pretrained
    temperature=0.3,
    top_p=0.9,
    do_sample=True,
    repetition_penalty=1.2    
                             )
print(f"Model output (tokens):\n{outputs[0]}\n")

outputs_decoded = tokenizer.decode(outputs[0], skip_special_tokens=True)
print(f"Model output (decoded):\n{outputs_decoded}\n")


gpt4_questions = [
    "What are the macronutrients, and what roles do thay play in the human body?",
    "How do vitamins and minerals differ in their roles and importance for human health?",
    "Describe the process of digestion and absorption of nutrients in the human body.",
    "What role does fiber play in digestion? Name five fiber containing foods.",
    "Explain the conecpt of energy balance and its significance in weight management.",
]

manual_questions = [
    "How offen should infants be brestfed?",
    "What are the symptoms of vitamin D deficiency?",
    "How  does saliva help with digestion?",
    "What are the benefits of dietary fiber?",
    "What is the role of protein in muscle repair?"

]

query_list=  gpt4_questions + manual_questions


def prompt_formatter(query: str, context_items: list[dict]) -> str:
    """Builds a simple and small-model-friendly prompt."""

    context = "\n".join([item["sentence_chunk"] for item in context_items])

    base_prompt = f"""
You are a helpful assistant. Use ONLY the context below to answer the question.
First, extract the most relevant sentences from the context.
Then, based on those extracted sentences, give a clear and complete answer.
If something is not mentioned, explicitly say "Not mentioned in the context."
Sources:
{context}

Question: {query}

Answer:
"""
    return base_prompt.strip()


    
                     
query = random.choice(query_list)
print(f"Query: {query}")
scores, indices = retrieve_relevant_resources(query=query,embeddings=embeddings)
# print(scores, indices)

context_items = [pages_and_chunks[idx] for idx in indices]

prompt = prompt_formatter(query=query, context_items=context_items)

print(prompt)

def init_rag(pdf_path="design_system.pdf"):
    """Run once to build embeddings & chunks for RAG use."""
    pages_and_texts = open_and_read_pdf(pdf_path)
    chunked_pages = chuck_pdf_pages(pages_and_texts, chunk_size=500)

    # Ensure consistency: add sentence_chunk field
    for c in chunked_pages:
        c["sentence_chunk"] = c["chunk_text"]

    text_chunks = [c["sentence_chunk"] for c in chunked_pages]
    chunk_embeddings = embedding_model.encode(text_chunks, convert_to_tensor=True,
                                               batch_size=16, 
                                            # tune for speed
        show_progress_bar=True
         )

    return chunked_pages, chunk_embeddings



# Only run automatically if script executed directly
if __name__ == "__main__":
    pages_and_chunks, embeddings = init_rag()
    print(f"Initialized RAG with {len(pages_and_chunks)} chunks")
