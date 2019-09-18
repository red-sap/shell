#!/usr/bin/env bash
#
#filepath : shell/cs.location.sh
#email : 1902750578@qq.com
#auther : red-sap
#date : 2019/10/12

#备份文件的命令
#    功能：针对某个文件，对其进行备份 ==>> hello.txt => hello.txt.bak
#    需要用到的命令 cp
#    cp hello.txt hello.txt.bak
cp -rf $1 $1.bak

