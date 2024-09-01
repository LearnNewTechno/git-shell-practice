#!/bin/bash

# Directory containing the files
DIRECTORY=$1

# String to find and replace
FIND_STRING=$2
REPLACE_STRING=$3

USAGE(){
    echo "USAGE : sh $0 <DIRECTORY> <FIND_STRING> <REPLACE_STRING> "
    exit 1
}

if [ ! -d $DIRECTORY ]
then 
    echo "Not a Directory"
    USAGE
    exit 1
fi

# Loop through each text file in the directory
for FILE in "$DIRECTORY"/*.txt
do
    if [ -f "$FILE" ]
    then
        # Use sed to find and replace the string
        sed -i "s/${FIND_STRING}/${REPLACE_STRING}/g" "$FILE"
        echo "Replaced in: $FILE"
    fi
done