#!/bin/bash

DOCKER_IMAGE_REPOSITORY=weidazhao/worksonmymachine
DOCKER_IMAGE_TAG=latest
DOCKERFILE_PATH=Docker/Dockerfile
PROJECT_NAME=WorksOnMyMachine

docker build -t $DOCKER_IMAGE_REPOSITORY:build \
             -f Dockerfile.build \
             --build-arg DOCKER_IMAGE_REPOSITORY=$DOCKER_IMAGE_REPOSITORY \
             --build-arg DOCKER_IMAGE_TAG=$DOCKER_IMAGE_TAG \
             --build-arg DOCKERFILE_PATH=$DOCKERFILE_PATH \
             --build-arg PROJECT_NAME=$PROJECT_NAME \
             --build-arg BUILD_CONFIGURATION=$BUILD_CONFIGURATION \
             ..

docker run -v /var/run/docker.sock:/var/run/docker.sock $DOCKER_IMAGE_REPOSITORY:build

docker push $DOCKER_IMAGE_REPOSITORY:$DOCKER_IMAGE_TAG

docker-compose -H=$DOCKER_HOST_AGENT0 -f docker-compose.yml down --rmi all --remove-orphans
docker-compose -H=$DOCKER_HOST_AGENT0 -f docker-compose.yml up -d
