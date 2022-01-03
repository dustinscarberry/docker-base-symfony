#!/bin/sh

docker login

# build and push base docker images

# base images
docker build -t dustinscarberry/symfony-base:php8.0 -f 8.0/base/Dockerfile .
docker push dustinscarberry/symfony-base:php8.0

docker build -t dustinscarberry/symfony-base:php8.1 -f 8.1/base/Dockerfile .
docker push dustinscarberry/symfony-base:php8.1

# extra images
docker build -t dustinscarberry/symfony-base:php8.0-extra -f 8.0/extra/Dockerfile .
docker push dustinscarberry/symfony-base:php8.0-extra

docker build -t dustinscarberry/symfony-base:php8.1-extra -f 8.1/extra/Dockerfile .
docker push dustinscarberry/symfony-base:php8.1-extra
