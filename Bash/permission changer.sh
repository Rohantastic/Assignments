#create file,display permission, change permission and then display!

#!/bin/bash
rm -rf test
mkdir test
cd test
touch file{1..100} && mkdir dir{1..100}
cd ..

stat -c %a test

chmod 777 test

stat -c %a test
