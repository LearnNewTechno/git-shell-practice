#!/bin/bash

NUMBER=$1
BLANK_STRING_REGEX='^\s*$'

if [[ $NUMBER =~ $BLANK_STRING_REGEX ]]
then 
    echo 'EMPTY'
else 
    if [ $NUMBER -gt 20 ] #gt, lt, eq, -ne, -ge, -le
    then
        echo "Given number: $NUMBER is greater than 20"
    else
        echo "Given number: $NUMBER is less than 20"
    fi
fi