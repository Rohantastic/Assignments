#!/bin/bash

read -p "enter the path" PATH
if [[ -d "$PATH" ]]
	then
		echo "Its a dir"
elif [[ -f "$PATH" ]]
		then
			echo "Its a file"
else
	
		echo "sys erorr"
fi

