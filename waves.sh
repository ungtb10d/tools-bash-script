#!bin/bash

rs=`tput sgr0`    # reset
g=`tput setaf 2`  # green
y=`tput setaf 3`  # yellow
r=`tput setaf 1`  # red
b=`tput bold`     # bold
u=`tput smul`     # underline
nu=`tput rmul`    # no-underline


echo ${g}"Plese run this script inside the pali client folder"${rs}
sleep 1
echo ${g}"What would you like to do?"${rs}
echo ${g}"a - Watch status of batch job"${rs}
echo ${g}"b - Mark job completed"${rs}
read answer
if [ $answer == "a" ]; then
    echo "What is the batch job id?"
    read batchjobid
    watch -n 30 --color "pali --env-type prod job batch-status $batchjobid | grep -e TOTAL -e FAILED -e INVALID"
elif [ $answer == "b" ]; then
    echo "What is the job id?"
    read jobid
    pali --env-type prod job mark-completed $jobid
else
    echo ${g}"Exited"${rs}
fi
