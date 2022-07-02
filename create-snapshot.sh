#!bin/bash

echo "Please run this code inside the pali-client folder"
echo "Please type the region of the environment you want to create a snapshot of"
read region
echo "Please type the ticket number in this format DEPT-0000"
read ticketnumber
echo "Please type the environment name"
read envname
echo "Please wait snapshot is being created"
pali --env-type prod --region $region env snapshot create --desc $ticketnumber $envname
echo "Please enter the job id to check the status of snapshot"
read jobid
pali --env-type prod job status $jobid
echo "Please type y to check the job status again"
read answer
if [ $answer == "y" ]; then
    pali --env-type prod job status $jobid
else
    echo "You have chosen to exit, Goodbye!"
fi
