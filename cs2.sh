#!/usr/bin/env bash
#
#filepath : shell/cs2.sh
#email : 1902750578@qq.com
#auther : red-sap
#date : 2019/10/12
name='假名'
age=38

echo "Name: ${name} ${age}"
echo 'Name: ${name} ${age}'


var01='hello_111'
var02='hello_222'
echo "交换前${var01} ${var02}"

var03=${var01}
var01=${var02}
var02=${var03}
echo "交换后${var01} ${var02}"
