#!/bin/sh

php81Version=php:8.1.27-fpm-alpine
php82Version=php:8.2.16-fpm-alpine
#php83Version=php:8.3.0-fpm-alpine

docker login

# build and push base docker images

# base images
sudo docker build -t dustinscarberry/symfony:php8.1 --build-arg PHP_VERSION=$php81Version -f images/base/Dockerfile .
docker push dustinscarberry/symfony:php8.1

sudo docker build -t dustinscarberry/symfony:php8.2 --build-arg PHP_VERSION=$php82Version -f images/base/Dockerfile .
docker push dustinscarberry/symfony:php8.2

#sudo docker build -t dustinscarberry/symfony:php8.3 --build-arg PHP_VERSION=$php83Version -f images/base/Dockerfile .
#docker push dustinscarberry/symfony:php8.3

# extra images
sudo docker build -t dustinscarberry/symfony:php8.1-extra --build-arg PHP_VERSION=$php81Version -f images/extra/Dockerfile .
docker push dustinscarberry/symfony:php8.1-extra

sudo docker build -t dustinscarberry/symfony:php8.2-extra --build-arg PHP_VERSION=$php82Version -f images/extra/Dockerfile .
docker push dustinscarberry/symfony:php8.2-extra

#sudo docker build -t dustinscarberry/symfony:php8.3-extra --build-arg PHP_VERSION=$php83Version -f images/extra/Dockerfile .
#docker push dustinscarberry/symfony:php8.3-extra