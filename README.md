# RAG Learning

A hands-on intro to **Retrieval-Augmented Generation (RAG)** built from scratch with a local knowledge base and a small open-source LLM.

## What's inside

| File | Purpose |
|------|---------|
| `rag_intro.ipynb` | End-to-end RAG notebook (embed → index → retrieve → generate) |
| `llm_kb.txt` | Knowledge base — 15 paragraphs covering LLM fundamentals |
| `requirements.txt` | Python dependencies |
| `make.sh` | Setup/run helper for Git Bash |
| `make.ps1` | Setup/run helper for PowerShell |

## Stack

- **Embeddings** — `sentence-transformers` (`all-MiniLM-L6-v2`)
- **Vector store** — `faiss`
- **Generator** — `google/flan-t5-base` via HuggingFace `transformers`
- **GPU** — auto-detected at runtime (NVIDIA CUDA or CPU fallback)

## Quickstart

**PowerShell**
```powershell
.\make.ps1 install       # create .venv and install deps
.\.venv\Scripts\Activate.ps1
.\make.ps1 jupyter       # open notebook
```

**Git Bash**
```bash
bash make.sh install     # create .venv and install deps
source .venv/Scripts/activate
bash make.sh jupyter     # open notebook
```

Then run all cells in `rag_intro.ipynb` top to bottom.
