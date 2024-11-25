#!/bin/sh

php81Version=php:8.1.31-fpm-alpine
php82Version=php:8.2.26-fpm-alpine
php83Version=php:8.3.14-fpm-alpine
php84Version=php:8.4.1-fpm-alpine

docker login

# build and push base docker images

# base images
docker buildx build --platform linux/amd64 -t dustinscarberry/symfony:php8.1 --build-arg PHP_VERSION=$php81Version -f images/base/Dockerfile .
docker push dustinscarberry/symfony:php8.1

docker buildx build --platform linux/amd64 -t dustinscarberry/symfony:php8.2 --build-arg PHP_VERSION=$php82Version -f images/base/Dockerfile .
docker push dustinscarberry/symfony:php8.2

docker buildx build --platform linux/amd64 -t dustinscarberry/symfony:php8.3 --build-arg PHP_VERSION=$php83Version -f images/base/Dockerfile .
docker push dustinscarberry/symfony:php8.3

docker buildx build --platform linux/amd64 -t dustinscarberry/symfony:php8.4 --build-arg PHP_VERSION=$php84Version -f images/base/Dockerfile .
docker push dustinscarberry/symfony:php8.4

# extra images
docker buildx build --platform linux/amd64 -t dustinscarberry/symfony:php8.1-extra --build-arg PHP_VERSION=$php81Version -f images/extra/Dockerfile .
docker push dustinscarberry/symfony:php8.1-extra

docker buildx build --platform linux/amd64 -t dustinscarberry/symfony:php8.2-extra --build-arg PHP_VERSION=$php82Version -f images/extra/Dockerfile .
docker push dustinscarberry/symfony:php8.2-extra

docker buildx build --platform linux/amd64 -t dustinscarberry/symfony:php8.3-extra --build-arg PHP_VERSION=$php83Version -f images/extra/Dockerfile .
docker push dustinscarberry/symfony:php8.3-extra

docker buildx build --platform linux/amd64 -t dustinscarberry/symfony:php8.4-extra --build-arg PHP_VERSION=$php84Version -f images/extra/Dockerfile .
docker push dustinscarberry/symfony:php8.4-extra