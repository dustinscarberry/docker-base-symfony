FROM php:8.0.16-fpm-alpine3.15

# add s6 services
COPY services.d /etc/services.d

# add s6 overlay
ADD https://github.com/just-containers/s6-overlay/releases/download/v2.2.0.1/s6-overlay-amd64-installer /tmp/
RUN chmod +x /tmp/s6-overlay-amd64-installer && /tmp/s6-overlay-amd64-installer /

# add composer installer
COPY --from=composer /usr/bin/composer /usr/bin/composer

# install php extensions
ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/
RUN chmod +x /usr/local/bin/install-php-extensions && \
    install-php-extensions imagick mysqli pdo_mysql gmp gd intl zip exif soap ldap oci8 sqlsrv pdo_sqlsrv opcache

# copy php.ini
COPY php.ini "$PHP_INI_DIR/php.ini"

# change php-fpm to socket
RUN rm /usr/local/etc/php-fpm.d/*
COPY www.conf /usr/local/etc/php-fpm.d/www.conf

# install nginx
RUN apk add --no-cache nginx

# copy app nginx config
COPY nginx/app.conf /etc/nginx/sites-enabled/default
COPY nginx/nginx.conf /etc/nginx/nginx.conf
COPY nginx/inc /etc/nginx/inc

# setup ldap and fix self signed certificates
RUN apk add --no-cache openldap
RUN echo "TLS_REQCERT never" >> /etc/openldap/ldap.conf

# fix nginx permissions
RUN chown -R www-data:www-data /var/lib/nginx

# copy symfony migration scripts
COPY migrations.sh /etc/cont-init.d/migrations.sh

EXPOSE 80

ENTRYPOINT ["/init"]
