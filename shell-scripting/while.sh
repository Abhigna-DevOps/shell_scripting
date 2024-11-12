#!/bin/bash
num=0
while [[ $num -le 9 ]]
do
    if (( num % 2 == 0 )); then
        echo "Uytr"
    else
        echo "not under range"
    fi
    num=$num+1
done


