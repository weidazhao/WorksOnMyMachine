#!/bin/bash

dotnet restore
dotnet publish -c $BUILD_CONFIGURATION

pushd bin/$BUILD_CONFIGURATION/netcoreapp1.0/publish/

docker build -t weidazhao/worksonmymachine:latest .
docker push weidazhao/worksonmymachine:latest

docker-compose -f $BUILD_SOURCESDIRECTORY/src/WorksOnMyMachine/docker-compose.yml down --rmi all
docker-compose -f $BUILD_SOURCESDIRECTORY/src/WorksOnMyMachine/docker-compose.yml up -d
