FROM richarvey/nginx-php-fpm:1.7.3

LABEL maintainer="Channarong Janpanich <cj.pipekung@gmail.com>"

RUN apk update && apk upgrade && \
    apk add --update --no-cache gmp gmp-dev && docker-php-ext-install gmp

ENV MEMCACHED_DEPS zlib-dev libmemcached-dev cyrus-sasl-dev
RUN apk add --no-cache --update libmemcached-libs zlib
RUN set -xe \
    && apk add --no-cache --update --virtual .phpize-deps $PHPIZE_DEPS \
    && apk add --no-cache --update --virtual .memcached-deps $MEMCACHED_DEPS \
    && pecl install memcached \
    && echo "extension=memcached.so" > /usr/local/etc/php/conf.d/20_memcached.ini \
    && rm -rf /usr/share/php7 \
    && rm -rf /tmp/* \
    && apk del .memcached-deps .phpize-deps

ADD ./nginx/errors /var/www/errors
ADD ./nginx/conf/default.conf /etc/nginx/sites-available/default.conf
ADD ./php/php.ini /usr/local/etc/php/php.ini

WORKDIR /var/www/html

EXPOSE 443 80
