from fastapi import FastAPI, Request, HTTPException
from typing import List, Dict
from datetime import datetime

app = FastAPI()
data_store: List[Dict] = []


@app.post("/receive")
async def receive_data(request: Request):
    try:
        json_data = await request.json()
        sender = request.client.host
        timestamp = datetime.now().isoformat()
        data_entry = {
            "sender": sender,
            "timestamp": timestamp,
            "data": json_data
        }
        data_store.append(data_entry)
        return {"status": "Data received successfully.", "entry": data_entry}
    except Exception as e:
        # Log the error here if logging is set up
        raise HTTPException(status_code=400, detail=str(e))

@app.get("/display")
@app.get("/")
async def display_data():
    return {"received_entries": data_store}
