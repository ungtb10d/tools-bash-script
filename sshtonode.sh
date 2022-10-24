#!/bin/bash

echo "Please type the instanceid to find out the instance name"
read instanceidname
cat ~/ssh.main.config | grep $instanceidname
echo "Please type the instance region"
read region
echo "Please type the instance id"
read instanceid
sshprod ng_proxy-nirvana-$region-$instanceid



