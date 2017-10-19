#!/bin/bash

out=./tmp
ip=$out/ip.txt
crypt=$out/ip.crypt
mkdir -p $out
dig +short myip.opendns.com @resolver1.opendns.com > $ip
openssl des3 -in $ip -out $crypt -pass pass:$1
rm $ip
#decrypt with
#openssl des3 -d -in ip.crypt -out ip.txt -pass pass:$1

#git status
#if [ $! -eq 0 ]
#then
#echo 'done!'
#fi
