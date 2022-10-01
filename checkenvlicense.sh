
# This will get license expiration dates for the environments ids added to environmentsids.txt file

echo "Getting the environment ids"
sleep 1
curl https://raw.githubusercontent.com/emirkoroglu/tools-bash-script/main/environmentsids.txt >> test.txt
echo "Environment ids received. Gathering license expiration dates"
while read p; do
  aws s3 cp s3://collibra-main-dgc-licenses/$p/license.lic - | grep -E 'customer|expirationDate'
done </home/ansible/test.txt
echo "Deleting the test text file"
sleep 1
rm -rf /home/ansible/test.txt