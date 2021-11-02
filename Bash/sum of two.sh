#sum of two numbers

#!/bin/bash
read -p "pehla number likho " VAR

read -p "dusra number likho " VAR2

let add=0
echo "dono ka addition hai: "
 expr $VAR + $VAR2

#echo "Dono ka addition hai, $add"

