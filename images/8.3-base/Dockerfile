ARG PHP_VERSION

FROM $PHP_VERSION

# add s6 services
COPY services.d /etc/services.d
RUN chmod -R +x /etc/services.d

# override service startup timeout
ENV S6_CMD_WAIT_FOR_SERVICES_MAXTIME=0

# add s6 overlay
ADD https://github.com/just-containers/s6-overlay/releases/download/v3.1.4.1/s6-overlay-noarch.tar.xz /tmp
RUN tar -C / -Jxpf /tmp/s6-overlay-noarch.tar.xz
ADD https://github.com/just-containers/s6-overlay/releases/download/v3.1.4.1/s6-overlay-x86_64.tar.xz /tmp
RUN tar -C / -Jxpf /tmp/s6-overlay-x86_64.tar.xz

# copy symfony migration scripts
COPY migrations.sh /etc/cont-init.d/migrations.sh
RUN chmod -R +x /etc/cont-init.d/migrations.sh

# add composer installer
COPY --from=composer /usr/bin/composer /usr/bin/composer

# install php extensions
ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/
RUN chmod +x /usr/local/bin/install-php-extensions && \
    install-php-extensions mysqli pdo_mysql gmp gd intl zip exif soap opcache redis && \
    install-php-extensions imagick/imagick@master

# copy php.ini
COPY php.ini "$PHP_INI_DIR/php.ini"

# change php-fpm to socket
RUN rm /usr/local/etc/php-fpm.d/*
COPY www.conf /usr/local/etc/php-fpm.d/www.conf

# adjust other php-fpm settings
COPY php-fpm.conf /usr/local/etc/php-fpm.conf

# install nginx
RUN apk add --no-cache nginx

# copy app nginx config
COPY nginx/app.conf /etc/nginx/sites-enabled/default
COPY nginx/nginx.conf /etc/nginx/nginx.conf
COPY nginx/inc /etc/nginx/inc

# fix nginx permissions
RUN chown -R www-data:www-data /var/lib/nginx

EXPOSE 80

ENTRYPOINT ["/init"]