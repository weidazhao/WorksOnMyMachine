#!/bin/bash

eval `ssh-agent`
ssh-add ~/.ssh/dazhao-swarm/id_rsa
scp -P 2200 $BUILD_SOURCESDIRECTORY/src/WorksOnMyMachine/docker-compose.yml azureuser@dazhao-swarmmgmt.westus.cloudapp.azure.com:~/docker-compose.sh
ssh azureuser@dazhao-swarmmgmt.westus.cloudapp.azure.com -A -p 2200 'bash -s' < ./RunOnSwarm.sh
