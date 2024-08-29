#!/bin/bash


echo "TEste $$"
echo "testd $0"
sleep 100 &
echo "tested $!"
echo "Pis $#"
echo " --------------------------------------------------------"
# echo "$@"
LOG_FOLDER="/var/log/shell-script"
FILE_NAME=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%F_%H_%M_%S)
LOG_FILE="$LOG_FOLDER/$FILE_NAME-$TIMESTAMP.log"

echo $LOG_FILE
echo "---------------------------------------------------------"

mkdir -p $LOG_FOLDER

USER=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

echo "started script executing at $(date)"

ROOT_USER()
{
        if [ $USER -ne 0 ]
        then
                echo "please user root user " | tee -a $LOG_FILE
                exit 1
        fi
}

VALIDATE_PACKAGE()
{
        if [ $1 -ne 0 ]
        then
                echo -e "$2 is $R  FAILED $N" | tee -a $LOG_FILE
                exit 1
        else
                echo -e "$2 is $G success $N" | tee -a $LOG_FILE
        fi
}

ROOT_USER


for package in $@
do
        echo "$package"
        dnf list installed $package &>> $LOG_FILE
        if [ $? -ne 0 ]
        then
               echo "$package is not installd, going to install.." | tee -a $LOG_FILE
               dnf install $package -y &>> $LOG_FILE
               VALIDATE_PACKAGE $? "Installing $package"
        else
               echo -e "#package is $Y already $N installed" | tee -a $LOG_FILE

        fi

done
