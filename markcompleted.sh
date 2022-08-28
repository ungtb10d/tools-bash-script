for n in $(https://raw.githubusercontent.com/emirkoroglu/tools-bash-script/main/failed-ids.txt )
do
    echo "Working on $n file name now"
    pali --env-type prod job mark-completed $n
done