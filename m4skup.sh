#!/bin/bash
clear
./.banner.sh
read -p "Enter the full path with file name: " fl
read -p "Enter comany name: " comp
mkdir ~/recon/$comp
n=1
cd ~/recon/$comp/
mkdir m4skup
cd m4skup
while read line;do
 #echo " Domain $n : $line"
 host $line |grep address | awk '{print $4}' >> m4skup.txt 
 host $line |grep address | awk '{print "Domain:"$1 " --->  " "Ip Adress:" $4}'
 n=$((n+1))
done < $fl 
