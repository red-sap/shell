#！/usr/bin/env bash
#服务端
timedatectl set-timezone Asia/Shanghai
cp /etc/chrony.conf  /etc/chrony.conf.bak
sed -i '3,6d' /etc/chrony.conf
sed -i '2a\server ntp1.aliyun.com iburst' /etc/chrony.conf
sed -i '3a\server ntp2.aliyun.com iburst' /etc/chrony.conf
sed -i '24a\allow 192.168.44.0/24' /etc/chrony.conf
timedatectl set-ntp yes
systemctl restart chronyd
systemctl enable chronyd


#######################################################
客户端
#！/usr/bin/env bash
timedatectl set-timezone Asia/Shanghai
cp /etc/chrony.conf  /etc/chrony.conf.bak
sed -i '3,6d' /etc/chrony.conf
sed -i '2a\server 192.168.44.134 iburst' /etc/chrony.conf
timedatectl set-ntp yes
systemctl restart chronyd
systemctl enable chronyd



查看时间同步源：

$ chronyc sources -v

查看时间同步源状态：

$ chronyc sourcestats -v

设置硬件时间

硬件时间默认为UTC：

$ timedatectl set-local-rtc 1

启用NTP时间同步：

$ timedatectl set-ntp yes

校准时间服务器：

$ chronyc tracking