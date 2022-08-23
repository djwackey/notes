FROM python:3.9-alpine

WORKDIR /usr/src/app

COPY requirements.txt /usr/src/app/
RUN apk --no-cache add automake build-base make libffi-dev linux-headers && \
    python -m venv /usr/venv && source /usr/venv/bin/activate && \
    pip install --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

ENV PATH /usr/venv/bin
