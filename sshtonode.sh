#!/bin/bash

echo "Please type the instanceid to find out the instance name"
read instanceid
cat ~/ssh.main.config | grep $instanceidname
echo "Please type the instance region"
read region
sshprod ng_proxy-nirvana-$region-$instanceid



