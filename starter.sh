#!/usr/bin/env bash

jenkinsURL="http://10.1.42.120:8080"
jenkinsUser="admin"
jenkinsUserAPIToken="11d3fcf8525e42044a204d77db2d0769f7"
executorCount=5

#### Note: If you want add new slave docker node then, edit 'serviceName' variable with right name and uncomment the following lines. Don't forget add new service name to the for iteration.
#serviceName='jswarmslave3'
#cat <<EOF >> docker-compose.yaml
#  $serviceName:
#    container_name: $serviceName
#    labels:
#      NAME: $serviceName
#    build: ./jswarmslave
#    restart: always
#    hostname: $serviceName
#EOF

for svcName in jswarmslave1 jswarmslave2 
do
    docker-compose run -d $svcName -master $jenkinsURL -username $jenkinsUser -password $jenkinsUserAPIToken -mode "normal" -name "$svcName" -disableClientsUniqueId -executors $executorCount
done
