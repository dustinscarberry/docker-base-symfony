#!/bin/sh

docker login

# build and push base docker images
docker build -t dustinscarberry/symfony-base:php8.0.13 -f 8.0/base/Dockerfile .
docker push dustinscarberry/symfony-base:php8.0.13

docker build -t dustinscarberry/symfony-base:php8.1 -f 8.1/base/Dockerfile .
docker push dustinscarberry/symfony-base:php8.1
