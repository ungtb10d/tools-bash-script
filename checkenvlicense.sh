

wget
while read p; do
  aws s3 cp s3://collibra-main-dgc-licenses/$p/license.lic - | grep expirationDate
done </Users/emir/REPOS/my-scripts/environments.txt

