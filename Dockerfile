FROM alpine:3.12
RUN apk update && apk add --no-cache bash git openssh python3 py3-pip

RUN python3 -m pip install --upgrade pip setuptools wheel pyparsing pydot django-extensions django

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
