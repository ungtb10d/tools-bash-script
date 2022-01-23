
#!/bin/bash

#copyright emirkoroglu - use it at your own risk. @emirsway

rs=`tput sgr0`    # reset
g=`tput setaf 2`  # green
y=`tput setaf 3`  # yellow
r=`tput setaf 1`  # red
b=`tput bold`     # bold
u=`tput smul`     # underline
nu=`tput rmul`    # no-underline

echo Copyright -EmirKoroglu - use it at your own risk
sleep 1
echo Tools are for Redhat 7 - CentOS 7
sleep 2
echo ${y}Welcome${rs}
echo ${y}"What would you like to do?${rs}
   a - Install Docker
   b - Install Terraform 0.14.11_linux_amd64
   c - Install Ansible
   d - Build or Destroy Ansible Environment
   e - Build or Destroy Ansible Tower
   f - Connect to a Docker Container to perform tasks
   g - Install Docker Compose
   h - Install Packer 1.2.5_linux_amd64
   i - Build or Destroy Jenkins QA-DEV-STAGE-PROD environment on AWS
   j - Create a backup of /mnt /media /var folders in backup folder
   k - Find files over 1G and zip them
   l - Upgrade the Kernel

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
  rm terraform_0.14.11_linux_amd64.zip
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


if [[ $input == "g" || $input == "g" ]];
then
  sudo yum install python3  python3-pip   -y
  sudo pip3 install --upgrade pip
  pip3 install docker-compose
  docker-compose version
else
  2> /dev/null
fi

if [[ $input == "h" || $input == "h" ]];
then
  sudo yum install wget -y
  sudo yum install unzip -y
  wget https://releases.hashicorp.com/packer/1.2.5/packer_1.2.5_linux_amd64.zip
  unzip packer_1.2.5_linux_amd64.zip
  sudo mv packer /usr/local/bin/
  rm packer_1.2.5_linux_amd64.zip
  packer version
else
  2> /dev/null
fi

if [[ $input == "i" || $input == "i" ]];
then
  bash -c "$(curl https://bashscriptfolder.s3.us-east-2.amazonaws.com/aws-jenkins-environment-with-terraform.sh)"
else
  2> /dev/null
fi

if [[ $input == "j" || $input == "j" ]];
then
mkdir /backup
cp -r /mnt /media /var /backup
cd /backup
tar cf backup.tar *
gzip backup.tar
else
  2> /dev/null
fi


if [[ $input == "k" || $input == "k" ]];
then
find / -type f -size +1G -exec gzip {} \;
else
  2> /dev/null
fi

if [[ $input == "l" || $input == "l" ]];
then
echo Before starting for Kernel upgrade please send out notification to everyone in team through Slack and Email.
sleep 3
echo  Reserve 1-4 hours maintenance window for a night. Usually 12:00 am to 4:00 am for Kernel upgrade.
sleep 3
echo Please stop all the running processes..
sleep 3
echo Warning! Please make sure you take a backup or snapshot before starting to Kernel upgrade. 
sleep 3
uname -r 
echo Please note the Kernel version..
sleep 10
echo Upgrade will be starting in 30 seconds please continue if above steps are completed.
sleep 30
echo Kernel upgrade starting please wait this may take some time....
yum update kernel -y 
echo Kernel upgrade completed. Restarting now...
sleep 3
reboot
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
 echo ${r}Exited${rs}
fi
#copyright @emirsway - use it at your own risk.
