FROM node:lts-alpine3.9
RUN apk update && apk add --no-cache bash git openssh python py-pip

RUN pip install --no-cache-dir -q --upgrade pip
RUN pip install --no-cache-dir -q django-extensions pyparsing pydot

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
