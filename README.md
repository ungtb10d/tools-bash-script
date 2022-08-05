# Shell Script to Install Top DevOps Tools for Red Hat / CentOS

# Everything has to be automated so we can spend more time on improving our projects by new strategies.

Install or Build most of the tools we used for day-to-day operations with bash script.

Options will be updated by the time to time.

Access directly from CLI

bash -c "$(curl https://bashscriptfolder.s3.us-east-2.amazonaws.com/tools.sh)"

Restart DGC

https://raw.githubusercontent.com/emirkoroglu/tools-bash-script/main/restart-dgc.sh

Create snapshot script

bash -c "$(curl https://raw.githubusercontent.com/emirkoroglu/tools-bash-script/main/create-snapshot.sh)"

Destroy env script;

bash -c "$(curl https://raw.githubusercontent.com/emirkoroglu/tools-bash-script/main/destroyenv.sh)"

Delete main.yml then push to new branch

bash -c "$(curl https://raw.githubusercontent.com/emirkoroglu/tools-bash-script/main/main-yml-delete.sh)"

Delete 2 multiple.yml then push to new branch.

bash -c "$(curl https://raw.githubusercontent.com/emirkoroglu/tools-bash-script/main/removemultiplemainyml.sh)"

Remove 3 main.yml then push to new brach

bash -c "$(curl https://raw.githubusercontent.com/emirkoroglu/tools-bash-script/main/remove3mainyml.sh)"


Monitor & mark job completed waves script

bash -c "$(curl https://raw.githubusercontent.com/emirkoroglu/tools-bash-script/main/waves.sh)"

Upgrade DGC for single env

bash -c "$(curl https://raw.githubusercontent.com/emirkoroglu/tools-bash-script/main/upgrade-dgc.sh)"



# What would you like to do?

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

m - Run a Jenkins docker image with persistent volume folder attached

#copyright emirkoroglu - use it at your own risk. @emirkoroglu
