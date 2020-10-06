FROM alpine:3.12
RUN apk update && apk add --no-cache bash git openssh python3 py3-pip graphviz

RUN python3 -m pip install --upgrade pip setuptools wheel
RUN pip3 install --no-cache-dir pygraphviz django-extensions django

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
