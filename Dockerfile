FROM python:3.10-slim-bullseye

RUN apt-get update -y && apt-get install -y --no-install-recommends bash git graphviz graphviz-dev musl-dev build-essential gcc && apt-get clean && rm -rf /var/lib/apt/lists/*
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
