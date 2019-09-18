#!/usr/bin/env bash
#
#filepath : shell/cs3.sh
#email : 1902750578@qq.com
#auther : red-sap
#date : 2019/10/12




#read -p 'please input your name: ' name
#read -p 'please input your age: ' age
#echo -e "你的名字为：${name} \n 你的年龄为：${age}"
#获取一个命令符执行结果，并赋值到一个变量身上
#hostname -->> localhost
hostname1=$(hostname)
echo ${hostname1}
