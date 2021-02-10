FROM alpine:3.13.1
RUN apk update && apk add --no-cache bash git gcc openssh python3 py3-pip graphviz graphviz-dev musl-dev postgresql-dev build-base python3-dev libffi-dev openssl-dev cargo
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
