#!/bin/bash

echo "Please type the folder that you want to remove files"
read folder
echo "Remove files older than how many days? (Please type the number only)"
read number
echo "Are you sure you want to delete files from $folder older than $number days? Please type yes to continue"
read answer
if [ $answer == "yes" ]; then
    echo "Remove operation starting"
    sleep 2
    find $folder* -mtime +$number -exec rm {} \;
    echo "Files in $folder older than $number days have been removed"
    echo "Please type yes to verify that no files exist older than $number days in the folder"
    if [ $answer == "yes" ]; then
       find $folder -mtime +$number -print
    else
       2> /dev/null
    fi
else
    echo "You have chosen to exit, Goodbye!"
fi



###find /collibra/collibra_data/dgc/temp* -mtime +60 -exec rm {} \;
###find . -mtime +30 -print