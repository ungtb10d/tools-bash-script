#!bin/bash

rs=`tput sgr0`    # reset
g=`tput setaf 2`  # green
y=`tput setaf 3`  # yellow
r=`tput setaf 1`  # red
b=`tput bold`     # bold
u=`tput smul`     # underline
nu=`tput rmul`    # no-underline



echo ${r}"Please run this code inside the pali-client folder"${rs}
echo ${y}"Please type the region of the environment you want to create a snapshot of"${rs}
read region
echo ${y}"Please type the Jira ticket number in this format PRODENG-1111"${rs}
read ticketnumber
echo ${y}"Please type the environment name"${rs}
read envname
echo ${y}"Please wait snapshot is being created"${rs}
pali --env-type prod --region $region env snapshot create --desc $ticketnumber $envname
echo ${y}"Please enter the job id to check the status of snapshot creation"${rs}
read jobid
pali --env-type prod job status $jobid
echo ${y}"Please type y to check the job status again"${rs}
read answer
if [ $answer == "y" ]; then
    pali --env-type prod job status $jobid
else
    echo ${g}"You have chosen to exit, Goodbye!"${rs}
fi
echo ${y}"If the job not completed you can check the status with below the command"${rs}
echo ${y}"pali --env-type prod job status $jobid"${rs}
echo ${y}"Exited, Goodbye"${rs}
