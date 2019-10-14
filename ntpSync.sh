#!/usr/bin/env bash
#
# author: bavdu
# date: @2019/07/22
# usage: sync system time.

if [ ! -f /usr/bin/ntpdate ];then			# !取反, -f判定是否存在这个文件
    yum -y install ntpdate
    ntpdate -b ntp1.aliyun.com &			# 同步时间
else
    ntpdate -b ntp1.aliyun.com &
fi
EOF
