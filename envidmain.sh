
echo "Please type the env name"
read envname
getenv $envname | grep -E 'Region|env_id|main.yml|env_deathdate|'