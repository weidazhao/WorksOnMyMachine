#!/bin/bash

eval `ssh-agent`
ssh-add ~/.ssh/acs-swarm/id_rsa
scp -P 2200 $BUILD_SOURCESDIRECTORY/src/WorksOnMyMachine/docker-compose.yml azuredevex@azuredevex-acsmgmt.southcentralus.cloudapp.azure.com:~/docker-compose.yml
scp -P 2200 $BUILD_SOURCESDIRECTORY/src/WorksOnMyMachine/RunOnSwarm.sh azuredevex@azuredevex-acsmgmt.southcentralus.cloudapp.azure.com:~/RunOnSwarm.sh
ssh azuredevex@azuredevex-acsmgmt.southcentralus.cloudapp.azure.com -A -p 2200 'chmod +x ~/RunOnSwarm.sh && ~/RunOnSwarm.sh'
