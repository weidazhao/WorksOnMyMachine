#!/bin/bash

BUILD_CONFIGURATION=Release
PROJECT_NAME=WorksOnMyMachine
IMAGE_NAME=weidazhao/worksonmymachine

docker build -t $IMAGE_NAME:build -f Dockerfile.build --build-arg IMAGE_NAME=$IMAGE_NAME:latest --build-arg PROJECT_NAME=$PROJECT_NAME --build-arg BUILD_CONFIGURATION=$BUILD_CONFIGURATION .

docker run -v /var/run/docker.sock:/var/run/docker.sock $IMAGE_NAME:build

docker push $IMAGE_NAME:latest
