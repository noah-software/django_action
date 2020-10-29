FROM alpine:3.12
RUN apk update && apk add --no-cache bash git gcc openssh python3 py3-pip graphviz graphviz-dev

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
