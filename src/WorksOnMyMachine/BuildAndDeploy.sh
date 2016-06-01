#!/bin/bash

dotnet restore
dotnet publish -c $BUILD_CONFIGURATION

pushd bin/$BUILD_CONFIGURATION/netcoreapp1.0/publish/

docker -H=$DOCKER_HOST_LOCAL build -t weidazhao/worksonmymachine:latest .
docker -H=$DOCKER_HOST_LOCAL push weidazhao/worksonmymachine:latest

popd

docker-compose -H=$DOCKER_HOST_AGENT0 -f $BUILD_SOURCESDIRECTORY/src/WorksOnMyMachine/docker-compose.yml down --rmi all
docker-compose -H=$DOCKER_HOST_AGENT0 -f $BUILD_SOURCESDIRECTORY/src/WorksOnMyMachine/docker-compose.yml up -d
