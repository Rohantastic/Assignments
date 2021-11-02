#display username and its shell.
#!/bin/bash

VAR=$(cat /etc/passwd | grep "bash" | awk -F':' '{print $1, $7}')

sleep 2s
echo "$VAR"
