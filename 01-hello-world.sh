#!/bin/bash

# Ctrl+S --> save, this is only for info purpose. not part of code
# Author - Sivakumar Reddy
# Team - DevOps
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
index_array=(0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15)
for n in ${index_array[@]}
do
    # echo $n
    var="$((31+n))m"
    echo -n "$var "
     COLOR="\e[$var"
    echo -e "$n is $COLOR SUCCESS $N" 
done