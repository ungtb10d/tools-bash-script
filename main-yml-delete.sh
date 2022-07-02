#!bin/bash


echo "Please run this code inside the switch_environments folder"
git pull
echo "Please type the Jira ticket number in this format DEPT-0000"
read ticketnumber
git checkout -b $ticketnumber
echo "Please type the main.yml location for the environment"
read mainyml
cat $mainyml | grep -E 'env_name|cloud|aws_region|env_deathdate'
env_name=`cat $mainyml | grep -E 'env_name' | awk '{print $2}'`
echo "Please type y if the above information is correct and you want to remove $env_name environment main.yml file"
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
else
    echo "Operation cancelled"
fi
