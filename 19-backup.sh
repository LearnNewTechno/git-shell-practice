#!/bin/bash

SOURCE_DIR=$1
DEST_DIR=$2
DAYs=${3:-14}
TIMESTAMP=$(date +%Y_%m_%d_%H_%M_%S)

echo '-------------------'
echo $DAYS
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

USAGE (){
     echo -e "$R USAGE:: $N sh 19-backup.sh <source> <destination> <days(optional)>"
}

if [ $# -lt 2 ]
then 
    USAGE
    exit 1
fi

if [ ! -d $SOURCE_DIR ]
then
    echo "$SOURCE_DIR does not exist...Please check"
fi

if [ ! -d $DEST_DIR ]
then
    echo "$DEST_DIR does not exist...Please check"
fi

# FILES=$(find ${SOURCE_DIR} -name "*.log" -mtime +$DAYS)

FILES=$(find ${SOURCE_DIR} -name "*.log" -mtime +14)

echo "Files: $FILES"

if [ ! -z $FILES ]
then
    echo "FIles are found"
    ZIP_FILE="$DEST_DIR/app_logs-$TIMESTAMP.zip"
    find ${SOURCE_DIR} -name "*.log" -mtime +$DAYS | zip "$ZIP_FILE" -@
    if [ -f $ZIP_FILE]
    then
        echo "successfully zipped older than $DAYS"
        while IFS= read -r file
        do  
            echo "DELETING file : $file"
            rm -rf $file
        done <<< FILES

    else 
        echo -e "Zipping the is $R FAILED..$N"
    fi
else 
    echo "No files older than $DAYS"
fi