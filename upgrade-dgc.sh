#/bin/bash

rs=`tput sgr0`    # reset
g=`tput setaf 2`  # green
y=`tput setaf 3`  # yellow
r=`tput setaf 1`  # red
b=`tput bold`     # bold
u=`tput smul`     # underline
nu=`tput rmul`    # no-underline

echo "Please type the environment name you want to upgrade"
read envname
echo "Please type the environment version you want to upgrade to"
read envversion
echo "Please type the ticket number in this format DEPT-00000"
read ticketnumber
echo "Please wait while we are upgrading your environment"
pali --env-type prod env upgrade --version $envversion --zendesk-ticket $ticketnumber $envname
echo "Upgrade started"
echo ${y}"Please enter the job id to check the status of job"${rs}
read jobid
pali --env-type prod job status $jobid
echo ${y}"Please type y to check the job status again"${rs}
read answer
if [ $answer == "y" ]; then
    pali --env-type prod job status $jobid
else
    echo ${g}"Exited, Goodbye!"${rs}
fi
