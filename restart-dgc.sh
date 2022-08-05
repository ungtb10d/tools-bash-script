#!/bin/bash


echo "Please type the env name that you want to restart the DGC"
read envname
run-pali.sh ansible playbook restart_dgc_env.yml $envname --tags start_dgc
