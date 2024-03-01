FROM node:lts-alpine3.15
LABEL maintainer="vaughngx4 (vaughng@pm.me)"
WORKDIR /
RUN mkdir -p /usr/qalarsmm/app
RUN apk add --no-cache --upgrade \
    php8 \
    php8-common \
    php8-cli \
    php8-mysqli \
    openssl \
    ca-certificates \
    su-exec \
    bash \
    jq
WORKDIR /usr/qalarsmm/app
COPY ./qalarsmm-api/ ./qalarsmm-api
RUN cd /usr/qalarsmm/app/qalarsmm-api/User && npm install && \
    cd ../Feeds && npm install && \
    cd ../Common && npm install && \
    cd ../Update && npm install && \
    cd ../Publish && npm install && \
    cd ../Notification && npm install && \
    cd ../Admin && npm install
RUN chown -R node /usr/qalarsmm/app
COPY ./sql-ping.php /sql-ping.php
COPY ./entrypoint.sh /docker-entrypoint.sh
COPY ./init.sh /init.sh
COPY ./config.sh /config.sh
ENTRYPOINT ["/docker-entrypoint.sh"]
