#!/bin/bash

echo "The file count is"
cat fil.txt | wc -l

sleep 2s

echo "     "

echo "total pdf"
cat fil.txt | grep "\.pdf"| wc -l ; sleep 2s
echo "total docs are"
cat fil.txt | grep "\.docx" | wc -l

echo "  "

echo "replacing pdfs to docx"
sleep 2s
sed -i s/pdf/docx/ fil.txt

echo "NOW TOTAL PDF"
cat fil.txt | grep "\.pdf"| wc -l ; sleep 2s
echo "and total docs are"
cat fil.txt | grep "\.docx" | wc -l

sleep 2s
echo "total files who has _ in between"
cat fil.txt | grep "_" 
