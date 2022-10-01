
echo "Getting the "
curl https://raw.githubusercontent.com/emirkoroglu/tools-bash-script/main/destroyenv.txt >> test.txt
echo "Environments received. Gathering informations"
while read p; do
  getenv $p | grep -E 'env_name|Region|env_id|main.yml|env_deathdate'
done </home/ansible/test.txt
echo "Deleting the test text file"
sleep 1
rm -rf /home/ansible/test.txt