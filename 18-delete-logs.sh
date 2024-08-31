
#!/bin/bash


SOURCE_DIR=/home/ec2-user/logs/

R="\e[31m"
G="\e[32m"
N="\e[0m"

if [ -d $SOURCE_DIR ]
then
        echo -e "$SOURCE_DIR $G directory exists$N"
else
        echo -e "$SOURCE_DIR $R directory not exists$N"

fi

FILES=$(find ${SOURCE_DIR} -name "*.log" -mtime +14)

echo "Files: $FILES"

while IFS= read -r file
do 
        echo "Deleting File: $file"

done <<< $FILES
