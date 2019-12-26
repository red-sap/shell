#!/usr/bin/env bash
#use create kvm
#version 0.1
#auther:redsap@126.com
echo "1.创建自定义配置单个虚拟机 2.批量创建自定义配置虚拟机 3.批量创建默认配置虚拟机 4.删除虚拟机"
read -p "选取你的操作(1/2/3):" op
batch_self_define() {
        kvmname=`openssl rand -hex 5`

        sourceraw=/var/lib/libvirt/images/kvm1.raw
        sourcexml=/etc/libvirt/qemu/kvm1.xml
        
        newraw=/var/lib/libvirt/images/${sourceraw}
        newxml=/etc/libvirt/qemu/${sourcexml}

        cp ${sourceraw} ${newraw}
        cp ${sourcexml} ${newxml}

        kvmuuid=`uuidgen`
        kvmmen=${1}000000
        kvmcpu=${2}
        kvmraw=${newraw}
        kvmmac=`openssl rand -hex 3 | sed -r 's/..\B/&:/g'


        sed -i ""












}