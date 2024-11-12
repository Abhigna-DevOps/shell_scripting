#!/bin/bash

<<comments
1 is folder name
2 is start range
3 is end range
comments

for ((i=$2; i<=$3; i++))
do
	mkdir $1$i
done

