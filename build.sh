#!/bin/sh

docker login
docker buildx bake --jobs=2 --push