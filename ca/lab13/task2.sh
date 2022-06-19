#!/bin/bash

IFS=' ' read -ra line1
IFS=' ' read -ra line2
sum1=0
tmp=0
for i in ${line1[*]}
do
    tmp=$(expr 0 + $i 2> /dev/null)
    if [ $? -ne 0 ]
        then
            sum1=`expr $sum1 - $sum1`
            break
        else
            sum1=`expr $tmp + $sum1`
        fi
    shift
done
sum2=0
tmp=0
for i in ${line2[*]}
do
    tmp=$(expr 0 + $i 2> /dev/null)
        if [ $? -ne 0 ]
            then
                sum2=`expr $sum2 - $sum2`
                break
            else
                sum2=`expr $tmp + $sum2`
            fi
        shift
done
if [ $sum1 -eq $sum2 ]
then
    echo "Equal"
else
    echo "Not equal"
fi