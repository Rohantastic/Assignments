#!/bin/bash

read -p "enter the first number " first
read -p "enter the second number" second

	if [ $first -gt $second ]
		then
			echo " $first is greater"
	else
		echo "$second is greater "
	fi
