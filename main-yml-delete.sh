#!bin/bash

rs=`tput sgr0`    # reset
g=`tput setaf 2`  # green
y=`tput setaf 3`  # yellow
r=`tput setaf 1`  # red
b=`tput bold`     # bold
u=`tput smul`     # underline
nu=`tput rmul`    # no-underline

echo "Please run this code inside the switch_environments folder"${rs}
git pull
echo ${y}"Please type the Jira ticket number in this format DEPT-0000"${rs}
read ticketnumber
git checkout -b $ticketnumber
echo ${y}"Please type the main.yml location for the environment"${rs}
read mainyml
cat $mainyml | grep -E 'env_name|cloud|aws_region|env_deathdate'
env_name=`cat $mainyml | grep -E 'env_name' | awk '{print $2}'`
echo ${r}"Please type y if the above information is correct and you want to remove $env_name environment main.yml file PERMANENTLY"${rs}
read answer
if [ $answer == "y" ]; then
    echo "Removing main.yml file"
    rm $mainyml
    echo "Adding the commit"
    git add .
    echo "Committing the changes"
    git commit -m "removing main.yml after $ticketnumber"
    echo "Pushing the commit"
    git push --set-upstream origin $ticketnumber
    echo "Now please go to github and create a pull request from $ticketnumber to master"
    echo ${y}"Operation Completed"${rs}
else
    echo "You have chosen to exit, Goodbye!"
fi
