#!/bin/bash

eval `ssh-agent`
ssh-add ~/.ssh/dazhao-swarm/id_rsa
scp -P 2200 $BUILD_SOURCESDIRECTORY/src/WorksOnMyMachine/docker-compose.yml azureuser@dazhao-swarmmgmt.westus.cloudapp.azure.com:~/docker-compose.sh
scp -P 2200 $BUILD_SOURCESDIRECTORY/src/WorksOnMyMachine/RunOnSwarm.sh azureuser@dazhao-swarmmgmt.westus.cloudapp.azure.com:~/RunOnSwarm.sh
ssh azureuser@dazhao-swarmmgmt.westus.cloudapp.azure.com -A -p 2200 'chmod +x ~/RunOnSwarm.sh && bash -s ~/RunOnSwarm.sh'
