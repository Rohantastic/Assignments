#linux users having IDs greater than 1000
#!/bin/bash

read user

VAR=$(cat /etc/passwd | grep "bash" |  grep "$user:" | awk -F ':' '{print $3}')
if [[ -n $VAR ]]
	then
		echo "$VAR"
else
	echo "The user does not exist " 

fi


sleep 2s

echo "wait, printing all linux users having IDs greater than 1000"
	cat /etc/passwd | 
