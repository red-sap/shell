#!/usr/bin/env bash
for i in 1 2 3;do
read -p "please input" sh
read -p "please input passwd" sh2
user1="ye"
user2="sk"
pass="123"
if [[ $sh = $user1 ]] || [[ $sh = $user2 ]];then
 { if [ $sh2 = $pass ] ;then
   echo "yes"
    break



   else
     echo   "mima no"
       break
fi }

else
echo "userno"

fi

done