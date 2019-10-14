#!/usr/bin/env bash
###
##
#
read -p "please input your network" netip
for i in $(seq 254);do
{
   ping -c1 -s0.5 ${netip}.${i} &>/dev/null
   if [ $? -eq 0 ]; then
      echo ${netip}.${i} >>onlinecomputer.txt
   else 
      echo ${netip}.${i} >>offlinecomputer.txt
fi
}&

done
wait
echo "complete! ^_-"

