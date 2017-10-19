#!/bin/bash

out=./tmp
ip=$out/ip.txt
crypt=$out/ip.crypt
mkdir -p $out
old=`openssl des3 -d -in $crypt -pass pass:$1`
new=`dig +short myip.opendns.com @resolver1.opendns.com`
echo $new > $ip
openssl des3 -in $ip -out $crypt -pass pass:$1
rm $ip

if [ $old != $new ] 
then
	git add $crypt
	git commit -m "Updated crypt" --quiet
	git push --quiet
fi
