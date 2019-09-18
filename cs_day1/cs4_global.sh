#!/usr/bin/env bash
#
#filepath : shell/cs_global.sh
#email : 1902750578@qq.com
#auther : red-sap
#date : 2019/10/12
#全局变量就是普通声明的变量，形式为：变量名=值
var='hello world'
function println() {
 local var='hello kitty'
echo "函数中变量值variable：${var}"
}
echo "全局变量variable: ${var}"
println
echo "全局变量variable: ${var}"
