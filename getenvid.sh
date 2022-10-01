

# This will get the envs ids for license check environments from licensecheckenvs.txt

echo "Getting the environments list "
curl https://raw.githubusercontent.com/emirkoroglu/tools-bash-script/main/licensecheckenvs.txt >> test.txt
echo "Environments received. Gathering informations"
while read p; do
  getenv $p | grep -E 'env_id'
done </home/ansible/test.txt
echo "Deleting the test text file"
sleep 1
rm -rf /home/ansible/test.txt