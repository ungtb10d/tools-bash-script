for n in $(/app/failed-ids.txt )
do
    echo "Working on $n file name now"
    pali --env-type prod job mark-completed $n
done
