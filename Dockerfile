FROM python:3.10-slim-buster

RUN sed -i 's|deb.debian.org|archive.debian.org|g' /etc/apt/sources.list && \
    sed -i '/security.debian.org/d' /etc/apt/sources.list && \
    apt-get update -y && apt-get install -y --no-install-recommends awscli

WORKDIR /app

COPY . /app
RUN pip install --no-cache-dir -r requirements.txt

CMD ["python3", "app.py"]
