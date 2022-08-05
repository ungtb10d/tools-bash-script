read envname
read envname2
read envname3
read envname4
read envname5
getenv $envname | grep -E 'env_id|main.yml|Region|Cloud_Provider'
getenv $envname2 | grep -E 'env_id|main.yml|Region|Cloud_Provider'
getenv $envname3 | grep -E 'env_id|main.yml|Region|Cloud_Provider'
getenv $envname4 | grep -E 'env_id|main.yml|Region|Cloud_Provider'
getenv $envname5 | grep -E 'env_id|main.yml|Region|Cloud_Provider'
