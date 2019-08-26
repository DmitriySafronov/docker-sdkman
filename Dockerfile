FROM ubuntu:latest

MAINTAINER Dmitriy Safronov <zimniy@cyberbrain.pw>

ENV LANG C.UTF-8

ENV SDKMAN_DIR /usr/local/sdkman

RUN set -x \
    && apt-get update -y \
    && apt-get dist-upgrade -y \
    && apt-get install -y curl unzip zip ca-certificates --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

RUN curl -s get.sdkman.io | bash

RUN set -x \
    && echo "sdkman_auto_answer=true" > $SDKMAN_DIR/etc/config \
    && echo "sdkman_auto_selfupdate=false" >> $SDKMAN_DIR/etc/config \
    && echo "sdkman_insecure_ssl=false" >> $SDKMAN_DIR/etc/config

WORKDIR $SDKMAN_DIR

COPY docker-entrypoint.sh /

RUN set -x \
    chmod a+x "/docker-entrypoint.sh" \
    chmod a+x "$SDKMAN_DIR/bin/sdkman-init.sh"

ENTRYPOINT ["/docker-entrypoint.sh"]
