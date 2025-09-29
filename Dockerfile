FROM python:3.10-slim-bullseye

# Install dependencies including AWS CLI
RUN apt-get update -y && \
    apt-get install -y --no-install-recommends awscli && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY . /app

RUN pip install --no-cache-dir -r requirements.txt

CMD ["python3", "app.py"]
