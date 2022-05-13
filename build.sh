#!/bin/sh

php8Version=php:8.0.19-fpm-alpine3.15
php81Version=php:8.1.5-fpm-alpine3.15

docker login

# build and push base docker images

# base images
docker build -t dustinscarberry/symfony-base:php8.0 --build-arg PHP_VERSION=$php8Version -f 8.0/base/Dockerfile .
docker push dustinscarberry/symfony-base:php8.0

docker build -t dustinscarberry/symfony-base:php8.1 --build-arg PHP_VERSION=$php81Version -f 8.1/base/Dockerfile .
docker push dustinscarberry/symfony-base:php8.1

# extra images
docker build -t dustinscarberry/symfony-base:php8.0-extra --build-arg PHP_VERSION=$php8Version -f 8.0/extra/Dockerfile .
docker push dustinscarberry/symfony-base:php8.0-extra

docker build -t dustinscarberry/symfony-base:php8.1-extra --build-arg PHP_VERSION=$php81Version -f 8.1/extra/Dockerfile .
docker push dustinscarberry/symfony-base:php8.1-extra
