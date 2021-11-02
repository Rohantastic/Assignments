#enter user name and return its process ID.
#!/bin/bash
read -p "Enter user name:" var
cat /etc/passwd |  grep $var | awk -F':' '{print $3}'
