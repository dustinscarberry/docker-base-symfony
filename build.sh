#!/bin/sh

php81Version=php:8.1.24-fpm-alpine
php82Version=php:8.2.11-fpm-alpine

docker login

# build and push base docker images

# base images
docker build -t dustinscarberry/symfony:php8.1 --build-arg PHP_VERSION=$php81Version -f images/base/Dockerfile .
docker push dustinscarberry/symfony:php8.1

docker build -t dustinscarberry/symfony:php8.2 --build-arg PHP_VERSION=$php82Version -f images/base/Dockerfile .
docker push dustinscarberry/symfony:php8.2

# extra images
docker build -t dustinscarberry/symfony:php8.1-extra --build-arg PHP_VERSION=$php81Version -f images/extra/Dockerfile .
docker push dustinscarberry/symfony:php8.1-extra

docker build -t dustinscarberry/symfony:php8.2-extra --build-arg PHP_VERSION=$php82Version -f images/extra/Dockerfile .
docker push dustinscarberry/symfony:php8.2-extra