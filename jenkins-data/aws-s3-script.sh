#/bin/bash


PASSWORD=$2
DB_HOST=$1
DB_NAME=$3
DATE=$(date +%H-%M-%S)
AWS_SECRET_KEY=$4
BUCKET_NAME=$5

mysqldump  -u root   -h $DB_HOST -p$PASSWORD $DB_NAME  > /tmp/db-$DATE.sql
export AWS_ACCESS_KEY_ID=AKIA2AHYBMJJPXFBCP7U
export AWS_SECRET_ACCESS_KEY=$AWS_SECRET_KEY
echo "Uploading files" &&  aws s3 cp  /tmp  s3://$BUCKET_NAME --recursive --exclude "*" --include "*.sql"
for f in $(find /tmp -name '*.sql' ); do rm $f; done

