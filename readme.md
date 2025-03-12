# FastAPI with ngrok Docker App

This project demonstrates how to set up a FastAPI server running inside a Docker container, publicly accessible via a custom ngrok domain.

## Project Structure

```
fastapi-ngrok-app/
├── Dockerfile
├── requirements.txt
├── entrypoint.sh
└── app
    └── main.py
```

## Setup Instructions

### Step 1: Build Docker Image

Run the following command to build your Docker image:

```bash
docker build -t fastapi-ngrok .
```

## How to Use

### Run your Docker Container

Run the following command to start your Docker container:

```bash
docker run -it --rm -p 8000:8000 --name fastapi-ngrok-container fastapi-ngrok
```

Your FastAPI server will start and automatically bind to your custom ngrok domain (`<ngrok-domain>`).

### Test Your API Locally

You can test the setup locally using these terminal commands:

#### To send data to your FastAPI app:

```bash
curl -X POST -H "Content-Type: application/json" -d "{\"name\":\"Lets grow Together\",\"message\":\"Test from Terminal\"}" http://localhost:8000/receive
```

#### To retrieve and display data:

```bash
curl http://localhost:8000/display
```

Your data entries, along with sender details, will be displayed in response to the `/display` endpoint.

### Access via ngrok

Your FastAPI app is publicly accessible at your ngrok URL:

```
https://<ngrok-domain>
```

Replace `<ngrok-domain>`with your actual ngrok domain (which you can get after account creation on ngrok ) to work properly.
Replace `<your-ngrok-authtoken>` in your `entrypoint.sh` file with your actual ngrok authentication token to authenticate properly.

