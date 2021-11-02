#searching names by its UID
#!/bin/bash

read -p "TYPE uid " VAR
sleep 2s
echo "  "
cat /etc/passwd | grep "$VAR" | awk -F ':' '{print $1}'


