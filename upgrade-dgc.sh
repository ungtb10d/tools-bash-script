#/bin/bash

echo "Please type the environment name you want to upgrade"
read envname
echo "Please type the environment version you want to upgrade to"
read envversion
echo "Please type the ticket number in this format DEPT-00000"
read ticketnumber
echo "Please wait while we are upgrading your environment"
pali --env-type prod env upgrade --version $envversion --zendesk-ticket $ticketnumber $envname
echo "Upgrade completed"
