FROM ubuntu:latest
RUN apt update && apt install --no-cache bash git openssh graphviz gcc
RUN python -m pip install --upgrade pip setuptools wheel pyparsing pydot django-extensions django

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
