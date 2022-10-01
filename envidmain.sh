
echo "Please type the env name"
read envname


curl https://raw.githubusercontent.com/emirkoroglu/tools-bash-script/main/environments.txt >> test.txt
echo "Environments received. Gathering informations"
while read p; do
  getenv $p | grep -E 'Region|env_id|main.yml|env_deathdate|'
done </home/ansible/test.txt
echo "Deleting the test text file"
sleep 1
rm -rf /home/ansible/test.txt