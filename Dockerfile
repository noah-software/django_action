FROM alpine:3.13.1
RUN apk update && apk add --no-cache bash git gcc openssh python3 py3-pip graphviz graphviz-dev musl-dev postgresql-dev python3-dev build-base
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
