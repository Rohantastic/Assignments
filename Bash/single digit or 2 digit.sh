#single digit or two digit
#!/bin/bash
read e

if [ $e -lt 10 ] 
        then
                echo "sinlge digit"


elif [ $e -gt 10 ] && [ $e -lt 100 ]
	then
		echo "two digit"

fi
