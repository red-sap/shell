#!/usr/bin/env bash
#
#filepath : shell/cs.sh
#email : 1902750578@qq.com
#auther : red-sap
#date : 2019/10/12
#usage : study pt variable
#变量的声明方式
var01=12
var02=3.14
var03='string'
var03_a="this is my house"
var03_huanhang="this first line.\n
this second line.\n
this last line"
var04=true


#变量的调用
#shell：echo ${var01}
echo ${var01}
echo ${var02}
echo ${var03}
echo -e ${var03_huanhang}
echo ${var04}
