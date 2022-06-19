#!/bin/bash

#research 1: exit status is zero unless some error has occured. 
#the exit status is non zero if some error has ouccured

#research 2: echo -n

read x

if test -z $x; then
echo "Hello, tmpuser?"
else
echo "Hello, ${x}!"
fi
