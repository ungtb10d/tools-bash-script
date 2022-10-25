#!/bin/bash

rs=`tput sgr0`    # reset
g=`tput setaf 2`  # green
y=`tput setaf 3`  # yellow
r=`tput setaf 1`  # red
b=`tput bold`     # bold
u=`tput smul`     # underline
nu=`tput rmul`    # no-underline


echo ${b}"Please type the folder that you want to remove files"${rs}
read folder
echo ${y}"Remove files older than how many days? (Please type the number only)"${rs}
read number
echo ${r}"Are you sure you want to delete files from $folder older than $number days? Please type yes to continue"${rs}
read answer
if [ $answer == "yes" ]; then
    echo ${y}"Remove operation in progress, Please wait..."${rs}
    sleep 2
    find $folder* -mtime +$number -exec rm {} \;
    echo ${g}"Files in $folder older than $number days have been removed"${rs}
    sleep 1
    echo ${u}"Please type yes to verify that no files exist older than $number days in the $folder choosed"${rs}
    read yes
    if [ $answer == "yes" ]; then
       find $folder -mtime +$number -print
       echo ${b}"Above output will be empty if no files exists more than $number days in the folder"${rs}
       echo ${b}"Goodbye!"${rs}
    else
       2> /dev/null
    fi
else
    echo ${b}"You have chosen to exit, Goodbye!"{rs}
fi
