#!/bin/bash
clear
./.banner
read -p "Enter the full path with file name: " fl
read -p "Enter company name: " comp
mkdir ~/recon/$comp &> /dev/null
n=1
cd ~/recon/$comp/
mkdir m4skup &> /dev/null
cd m4skup
while read line;do
 #echo " Domain $n : $line"
 host $line |grep address | awk '{print $NF}' >> m4skup.txt 
 host $line |grep address | awk '{print "Domain:"$1 " --->  " "Ip Adress:" $NF}'
 host $line |grep address | awk '{print "Domain:"$1 " --->  " "Ip Adress:" $NF}' >> domainwithip.txt
 n=$((n+1))
done < $fl 
cat ~/recon/$comp/m4skup/m4skup.txt | sort -u > m4skup-all.txt
