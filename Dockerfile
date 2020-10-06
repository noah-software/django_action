FROM python:alpine3.12
RUN apk update && apk add --no-cache bash git openssh python3

RUN pip3 install --no-cache-dir -q --upgrade pip
RUN pip3 install --no-cache-dir -q django-extensions pyparsing pydot

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
