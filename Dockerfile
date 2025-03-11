FROM python:3.11-slim

# Install dependencies
RUN apt-get update && apt-get install -y wget unzip

# Install ngrok
RUN wget https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.zip \
    && unzip ngrok-v3-stable-linux-amd64.zip \
    && mv ngrok /usr/local/bin/ngrok \
    && rm ngrok-v3-stable-linux-amd64.zip

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY app/ ./app/
COPY entrypoint.sh .

RUN chmod +x entrypoint.sh

EXPOSE 8000

ENTRYPOINT ["./entrypoint.sh"]
