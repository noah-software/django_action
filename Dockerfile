FROM python:3.10-slim-bullseye

RUN apt-get update -y && apt-get install -y --no-install-recommends bash git graphviz graphviz-dev musl-dev build-essential gcc python3-dev libffi-dev poppler-utils zlib1g-dev libjpeg-dev libssl-dev && apt-get clean && rm -rf /var/lib/apt/lists/*
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
