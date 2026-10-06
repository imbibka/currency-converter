import os
import uvicorn
from fastapi import FastAPI, Response

app = FastAPI()

# фиксированный курс валют (1 USD = 500 KZT)
EXCHANGE_RATE = 500.0

@app.get("/")
def read_root():
    return {"message": "Welcome to Currency Converter API. Use /convert?amount=10"}

@app.get("/healthz")
def health_check():
    return Response(content="ok", media_type="text/plain")

@app.get("/convert")
def convert_currency(amount: float = 1.0):
    result = amount * EXCHANGE_RATE
    return {
        "source": "USD",
        "target": "KZT",
        "amount": amount,
        "result": result
    }

if __name__ == "__main__":
    port = int(os.environ.get("PORT", 8080))
    uvicorn.run(app, host="0.0.0.0", port=port)
