#!/usr/bin/env bash
###
##
#
systemctl stop firewalld && systemctl disable firewalld && setenforce 0
sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config

yum install -y wget
rm -rf /etc/yum.repos.d/*
wget -O /etc/yum.repos.d/epel.repo http://mirrors.aliyun.com/repo/epel-7.repo
wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
yum clean all
yum makecache
yum install -y vim net-tools
rzb=$(yum provides rz |awk 'NR==6{ print  $1}')
yum install -y ${rzb}
