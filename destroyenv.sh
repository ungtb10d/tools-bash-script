#!bin/bash

rs=`tput sgr0`    # reset
g=`tput setaf 2`  # green
y=`tput setaf 3`  # yellow
r=`tput setaf 1`  # red
b=`tput bold`     # bold
u=`tput smul`     # underline
nu=`tput rmul`    # no-underline

echo ${b}"Please run this script inside tf shell of the environment otherwise it won't work"${rs}
sleep 1
echo ${g}"Please enter the tmp folder location"${rs}
read tmp_folder
cd $tmp_folder
cat main.yml | grep -E 'env_name|cloud|aws_region|env_deathdate'
env_name=`cat main.yml | grep -E 'env_name' | awk '{print $2}'`
echo ${r}"Please make sure environment $env_name deathdated"${rs}
sleep 1
echo ${r}"Please type y if the above information is correct and you want to destroy $env_name environment"${rs}
read answer
if [ $answer == "y" ]; then
    echo ${y}"Running destroy plan to verify if environment $env_name ready for destruction"${rs}
    sleep 1
    terragrunt plan-all -destroy
    echo ${b}"If you see any error related to module please type y to replace the module provider in reporting and dgc folder, otherwise to start
    destroy operation please type d"${rs}
    read answer
    if [ $answer == "y" ]; then
        echo "Replacing provider, Please wait..."
        cd reporting/
        terragrunt state replace-provider 'registry.terraform.io/-/aws' 'registry.terraform.io/hashicorp/aws'
        terragrunt init
        terragrunt state replace-provider registry.terraform.io/-/template registry.terraform.io/hashicorp/template
        terragrunt init
        cd ..
        cd dgc
        terragrunt state replace-provider 'registry.terraform.io/-/aws' 'registry.terraform.io/hashicorp/aws'
        terragrunt init
        terragrunt state replace-provider registry.terraform.io/-/template registry.terraform.io/hashicorp/template
        terragrunt init
        echo "Provider replaced returning to tmp folder"
        cd ..
        terragrunt plan-all -destroy
        echo ${r}"If you do not see any issues above please type y to destroy the environment, WARNING this will destroy the environment"${rs}
        read answer
        if [ $answer == "y" ]; then
            echo ${g}"Destroying environment $env_name starting"${rs}
            terragrunt destroy-all
        else
            2> /dev/null
        fi
    else
        2> /dev/null
    fi
    if [ $answer == "d" ]; then
        echo ${g}"Destroying environment $env_name starting"${rs}
        terragrunt destroy-all
        echo ${g}"Type y to apply TF_VAR_force_destroy_backup_bucket=true for GCP envs"${rs}
        read answer
        if [ $answer == "y" ]; then
            cd $tmp_folder/dgc
            TF_VAR_force_destroy_backup_bucket=true terragrunt apply -target google_storage_bucket.backup-bucket
            echo ${g}"Do not forget to deactive and delete IAM Access for the environment in AWS, after that run the script again to destroy the bucket"${rs}
            sleep 1
            echo "This is how you search for the IAM user for the env  user-gcp-{env_id}-tmp"
            sleep 1
            echo ${g}"Please type y if you removed the IAM access for the environment and destroy operation will start"${rs}
            read answer
            if [ $answer == "y" ]; then
                terragrunt destroy-all
            else
                2> /dev/null
            fi
        else
            2> /dev/null
        fi
    else
        2> /dev/null
    fi
else
    echo ${y}"You have chosen to exit, Goodbye!"${rs}
fi
