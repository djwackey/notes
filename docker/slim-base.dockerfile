FROM python:3.9-slim

WORKDIR /usr/src/app

# set env variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

COPY requirements.txt /usr/src/app/
RUN apt-get update && apt-get install -y --no-install-recommends g++ gcc && \
    apt-get purge -y --auto-remove && rm -rf /var/lib/apt/lists/* && \
    python -m venv /usr/venv && . /usr/venv/bin/activate && \
    pip install --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

ENV PATH /usr/venv/bin
