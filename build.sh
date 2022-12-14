#!/bin/sh

php8Version=php:8.0.26-fpm-alpine3.16
php81Version=php:8.1.13-fpm-alpine3.16
php82Version=php:8.2-fpm-alpine3.16

docker login

# build and push base docker images

# base images
docker build -t dustinscarberry/symfony-base:php8.0 --build-arg PHP_VERSION=$php8Version -f images/base/Dockerfile .
docker push dustinscarberry/symfony-base:php8.0

docker build -t dustinscarberry/symfony-base:php8.1 --build-arg PHP_VERSION=$php81Version -f images/base/Dockerfile .
docker push dustinscarberry/symfony-base:php8.1

docker build -t dustinscarberry/symfony-base:php8.2 --build-arg PHP_VERSION=$php82Version -f images/base/Dockerfile .
docker push dustinscarberry/symfony-base:php8.2

# extra images
docker build -t dustinscarberry/symfony-base:php8.0-extra --build-arg PHP_VERSION=$php8Version -f images/extra/Dockerfile .
docker push dustinscarberry/symfony-base:php8.0-extra

docker build -t dustinscarberry/symfony-base:php8.1-extra --build-arg PHP_VERSION=$php81Version -f images/extra/Dockerfile .
docker push dustinscarberry/symfony-base:php8.1-extra

docker build -t dustinscarberry/symfony-base:php8.2-extra --build-arg PHP_VERSION=$php82Version -f images/extra/Dockerfile .
docker push dustinscarberry/symfony-base:php8.2-extra