#!/bin/bash

echo "What would you like to do?
   a - Install Docker
   b - Install Terraform 0.14.11_linux_amd64
   c - Install Ansible
   d - Build or Destroy Ansible Environment
   e - Build or Destroy Ansible Tower
   f - Connect to a Docker Container to perform tasks"
read input

if [[ $input == "a" || $input == "a" ]];
then
  curl -fsSL https://get.docker.com -o get-docker.sh
  sudo sh get-docker.sh
  sudo systemctl start docker
  sudo systemctl enable docker
  systemctl status docker
elif  [[ $input == "b" || $input == "b" ]];
then
  wget https://releases.hashicorp.com/terraform/0.14.11/terraform_0.14.11_linux_amd64.zip
  unzip  terraform_0.14.11_linux_amd64.zip
  sudo mv terraform  /bin
  terraform version
else
  2> /dev/null
fi

if [[ $input == "c" || $input == "c" ]];
then
  sudo amazon-linux-extras install ansible2 -y
  ansible --version
  ansible localhost -m ping
elif  [[ $input == "d" || $input == "d" ]];
then
  bash -c "$(curl https://bucket-to-check-aws-tasks.s3.amazonaws.com/AWS/scripts/shared_scripts/ansible_menu.sh)"
else
  2> /dev/null
fi

if [[ $input == "e" || $input == "e" ]];
then
  bash -c "$(curl https://bucket-to-check-aws-tasks.s3.amazonaws.com/AWS/scripts/shared_scripts/ansible_tower_menu.sh)"
else
  2> /dev/null
fi

if [[ $input == "f" || $input == "f" ]];
then
  echo Please Enter the Docker Image

  read IMAGE
  echo Please Wait!
  docker run -d --name task -P  $IMAGE  2> /dev/null

  docker ps 

  echo Please enter the running Container ID

  read CONTAINERID

  docker exec -it "$CONTAINERID"  bash   2> /dev/null

  sleep 1

  echo Warning! Would you like to delete all images and containers? only y will be accepted
  read y
  if  [ $y = "y" ]
  then
  docker rm -f `docker ps -qa` 
  docker rmi -f $(docker images -aq)
  else
  echo "Destroy Cancelled"
  fi
else
  echo Invalid action, please try again.
fi

#copyright emirsway 2021
