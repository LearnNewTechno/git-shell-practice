
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

while IFS= read -r file #IFS,internal field seperatpor, empty it will ignore while space.-r is for not to ingore special charecters like /
do
    echo "Deleting file: $file"

done <<< $FIlES


FILES=$(find ${SOURCE_DIR} -name "*.log" -mtime +14)
echo "Files: $FILES"

# dont use line, it is reserverd word
while IFS= read -r file #IFS,internal field seperatpor, empty it will ignore while space.-r is for not to ingore special charecters like /
do
    echo "Deleting file: $file"
#     rm -rf $file
done <<< $FILES