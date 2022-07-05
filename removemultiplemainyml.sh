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
    echo "Please type y if you like to commit this or type a to remove another main.yml file"
    read answer
    if [ $answer == "y" ]; then
        echo "Adding the commit"
        git add .
        echo "Committing the changes"
        git commit -m "removing main.yml after $ticketnumber"
        git push --set-upstream origin $ticketnumber
        echo ${y}"Commit successfully pushed."${rs}
        echo ${y}"Now please go to github and create a pull request from $ticketnumber to master"${rs}
    else
          2> /dev/null
    fi
    if [ $answer == "a" ]; then
        echo "Please type the main.yml location for the environment"
        read mainyml2
        cat $mainyml2 | grep -E 'env_name|cloud|aws_region|env_deathdate'
        env_name=`cat $mainyml2 | grep -E 'env_name' | awk '{print $2}'`
        echo ${r}"Please type y if the above information is correct and you want to remove $env_name environment main.yml file PERMANENTLY"${rs}
        read answer
        if [ $answer == "y" ]; then
            echo "Removing main.yml file"
            rm $mainyml2
            echo "Please type y if you like to commit this?"
            read answer
            if [ $answer == "y" ]; then
                echo "Adding the commit"
                git add .
                echo "Committing the changes"
                git commit -m "removing main.yml after $ticketnumber"
                git push --set-upstream origin $ticketnumber
                echo ${y}"Commit successfully pushed."${rs}
                echo ${y}"Now please go to github and create a pull request from $ticketnumber to master"${rs}
            else
                echo "Exited, Goodbye!"
            fi
        else
            2> /dev/null
        fi
    else
        2> /dev/null
    fi
else
    echo "You have chosen to exit, Goodbye!"
fi
