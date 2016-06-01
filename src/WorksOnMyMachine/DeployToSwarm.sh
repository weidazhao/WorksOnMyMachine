#!/bin/bash

dotnet restore
dotnet publish -c $BUILD_CONFIGURATION

pushd bin/$BUILD_CONFIGURATION/netcoreapp1.0/publish/

docker build -t weidazhao/worksonmymachine:latest .
docker push weidazhao/worksonmymachine:latest

scp $BUILD_SOURCESDIRECTORY/src/WorksOnMyMachine/docker-compose.yml $ACS_AGENT0:~/docker-compose.yml
scp $BUILD_SOURCESDIRECTORY/src/WorksOnMyMachine/RunOnSwarm.sh $ACS_AGENT0:~/RunOnSwarm.sh
ssh $ACS_AGENT0 'chmod +x ~/RunOnSwarm.sh && ~/RunOnSwarm.sh'
