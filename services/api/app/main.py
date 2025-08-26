from fastapi import FastAPI, HTTPException
from pydantic import BaseModel

app = FastAPI(title="Agent Benchmark API")

class QuizItem(BaseModel):
    question: str | None = None
    answer: str | None = None

# BUG: Missing validation – accepts empty payload and returns 200
@app.post("/quiz/create")
def quiz_create(item: QuizItem):
    # should validate that question/answer are present and non-empty
    return {"status": "ok", "item": item}

@app.get("/healthz")
def healthz():
    return {"ok": True}
