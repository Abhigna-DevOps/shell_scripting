#!/bin/bash

<< disclaimer
this is for infotainment purpose
disclaimer

read -p "checking loyalty: " man

read -p "love %" love
if [[ $man == "Amway" ]];
then
	echo "man is loyal"
elif [[ $love -ge 100 ]];
then
	echo "man is loyal with love"
else
	echo "man is not loyal"
fi

