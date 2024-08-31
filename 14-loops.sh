#!/bin/bash

# for i in {0..10} #0-10
# do
# 	echo $i
# done

a=0
while [ "$a" -lt 4 ]    # this is loop1
do
   b="$a"
   while [ "$b" -ge 0 ]  # this is loop2
   do
      echo -n "$b "
      b=$(($b - 1))
   done
   echo
   a=$(($a + 1))
done
# echo "1"
# echo "2"
# echo "3"
# echo "4"
# echo "5"
# echo "6"
# echo "7"
# echo "8"
# echo "9"
# echo "10"