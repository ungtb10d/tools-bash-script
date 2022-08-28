for n in $(emirkoroglu/tools-bash-script/failed-ids.txt )
do
    echo "Working on $n file name now"
    pali --env-type prod job mark-completed $n
done