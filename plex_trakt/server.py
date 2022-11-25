from fastapi import FastAPI, Request
import logging

logger = logging.getLogger(__name__)
logger.setLevel(logging.DEBUG)
logger.addHandler(logging.StreamHandler())

app = FastAPI()


@app.get("/")
async def root():
    return {"message": "Hello World"}

@app.post("/webhook")
async def webhook(request: Request):
    print(request.query_params)
    print(request.headers)
    print(await request.body())
    return {"message": "Hello World"}
