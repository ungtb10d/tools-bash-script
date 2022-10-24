#!/bin/bash

echo "Please type the instanceid to find out the instance name"
read instanceid
cat ~/ssh.main.config | grep $instanceid
echo "Please type the instance region"
read region
sshprod ng_proxy-nirvana-$region-$instanceid



