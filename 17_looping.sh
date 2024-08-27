#!/bin/bash

USERID=$(id -u)

ERROR_LOG="/d/ravi/log"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
TIMESTAMP_NAME=$(date +%F-%H-%M-%S-%N)
LOG_FILE="$ERROR_LOG/$SCRIPT_NAME-$TIMESTAMP_NAME.log"

mkdir -p $ERROR_LOG
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

VALIDATE (){
    if [ $1 -ne 0 ]
    then 
        echo "$2 is.. $R Failed $N"
    else 
         echo "$2 is.. $R Success $N"
    fi
}

USER_ROOT(){
    if [ $USERID -ne 0 ]
    then
        echo 'Please execute with root user' | tee -a $LOG_FILE
        exit 1
    fi
}
USER_ROOT
for package in $@
do 
   echo $package
    dnf list installed $package
    if [ $? -ne 0]
    then 
        echo  "$package is not installed, it is going to install  "
        dnf install $package -y
        VALIDATE $? "Installing $package"
    fi
done