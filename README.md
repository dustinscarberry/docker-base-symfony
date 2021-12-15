# Symfony App Base Image

## Current variants

### 8.0.x

Base box with nginx / php-fpm and migration scripts. Comes with basic PHP extensions.

### 8.0.x-extra

Base box with nginx / php-fpm and migration scripts. Comes with basic PHP extensions as well as sqlsrv, pdo_sqlsrv, oci8 and ldap.

### 8.1.x

Base box with nginx / php-fpm and migration scripts. Comes with basic PHP extensions.

### 8.1.x-extra

Base box with nginx / php-fpm and migration scripts. Comes with basic PHP extensions as well as sqlsrv, pdo_sqlsrv, oci8 and ldap.

## Usage

```docker
FROM dustinscarberry/symfony-base:8.0.x

# set workdir
WORKDIR /var/www/html

# copy app files to /var/www
COPY --chown=www-data:www-data . /var/www/html

# build app dependencies
RUN apk add --no-cache make gcc g++ python3 npm && \
  composer i --no-scripts --no-dev && \
  npm ci && \
  npm run prod && \
  apk del make gcc g++ python3 npm && \
  rm -rf node_modules

# fix web permissions
RUN chown -R www-data:www-data *

EXPOSE 80
```

## Building / updating base boxes

```sh
./build.sh
```
