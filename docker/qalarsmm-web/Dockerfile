FROM nginx:alpine
LABEL maintainer="vaughngx4 (vaughng@pm.me)"
WORKDIR /
RUN mkdir -p /usr/qalarsmm/app
RUN apk update && apk add --no-cache \
    bash \
    jq \
    php8 \
    php8-fpm \
    php8-session \
    php8-dom \
    php8-tokenizer \
    php8-fileinfo \
    php8-apache2 \
    php8-mysqli \
    php8-opcache \
    php8-common \
    php8-cli \
    php8-curl \
    php8-xml \
    php8-xmlwriter \
    composer
RUN rm -rf /var/cache/apk/*
WORKDIR /usr/qalarsmm/app
#COPY ./php.ini /etc/php8/php.ini
RUN rm -f /etc/nginx/conf.d/default.conf
COPY ./qalarsmm-web-php ./qalarsmm-web-php
RUN cd ./qalarsmm-web-php && composer install
RUN chown -R nginx:nginx /usr/qalarsmm/app && \
    sed -i "s;nobody;nginx;g" /etc/php8/php-fpm.d/www.conf
COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./nginx-qalarsmm-web.conf /etc/nginx/templates/qalarsmm.conf.template
COPY ./entrypoint.sh /docker-entrypoint.sh
COPY ./init.sh /init.sh
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD /usr/sbin/nginx && php-fpm8 -O && tail -f /dev/null
