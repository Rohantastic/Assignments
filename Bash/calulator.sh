#!/bin/bash
read -p "enter first num" first
read -p "enter second num" second

let sum=0
let sub=0
let mul=0
let div=0

sum= expr $first + $second
sub= expr $first - $second
mul= expr $first \* $second
div= expr $first / $second 

echo "$sum , $sub , "$mul , $div "
