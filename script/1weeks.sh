
作业：
==============================================================
1. ping主机测试
----------------------------------------------------------
    1） 显式赋值     
#!/usr/bin/env bash
for ip in $(seq 1 255);
do
{
ping 172.16.22.$ip -c1  &> /dev/null

if [ $? -eq 0 ];then

echo "172.16.22.$ip" >> accessip.txt

else

echo "172.16.22.$ip" >> denyip.txt

fi
} &
done
  
---------------------------------------------------------------       
    2）read从键盘读如   
#!/usr/bin/env bash
read -p "请输入测试网段,格式为X.X.X.:" net
for ip in $(seq 1 255);
do
{
ping ${net}${ip} -c1  &> /dev/null

if [ $? -eq 0 ];then

echo "${net}${ip}" >> accessip.txt

else

echo "${net}${ip}" >> denyip.txt

fi
} &
done


--------------------------------------------------------------          
    3）位置变量（参数赋值）
#!/usr/bin/env bash
pingtest(){
for ip in $(seq 1 255);
do
{
ping ${1}${ip} -c1  &> /dev/null

if [ $? -eq 0 ];then

echo "${1}${ip}" >> accessip.txt

else

echo "${1}${ip}" >> denyip.txt

fi
} &
done
}
pingtest $1

--------------------------------------------------------------
3. 判断一个用户是否存在
#!/usr/bin/env bash
id $1 >/dev/null
if [ $? -eq 0 ];then
echo "user exist"
else
echo "nonexist"
fi

------------------------------------------------------------------------------------------------------
4. 判断当前内核主版本是否为3，且次版本是否大于10
#!/usr/bin/env bash
main=$(cat /etc/redhat-release | awk  '{print $4}' | cut -c 3)
next=$(cat /etc/redhat-release | awk  '{print $4}' | awk -F '.' '{print $3}' | cut -c 1-2)
if [[ $main -eq 3 ]] && [[ $next -gt 10 ]];then
echo "主版本为3,且次版本大于10"
fi
-------------------------------------------------------------------------------------------------------
5. 判断vsftpd软件包是否安装，如果没有则自动安装
#!/usr/bin/env bash
 rpm -qa | grep vsftpd
if [ $? -eq 0 ];then
 echo " vsftpd service installed"
else
 yum install -y vsftpd
 systemctl restart vsftpd
 echo " vsftpd installing"
 echo " vsftpd installed and running"
fi
--------------------------------------------------------------------------------------------------------
6. 判断httpd是否运行   
#!/usr/bin/env bash
systemctl status httpd |grep 'active (running)'
if [ $? -eq 0 ];then
echo "httpd service is running"
else
echo "httpd service is down"
fi

--------------------------------------------------------------------------------------------------------	
9. 判断指定的主机是否能ping通，必须使用$1变量
-------------------------------------------------------------------------------------------------------
10. 判断: 如果vsftpd启动，输出以下信息：
   vsftpd服务器已启动...
   vsftpd监听的地址是: 
   vsftpd监听的端口是:
   vsftpd的进程PID是:
#!/usr/bin/env bash
systemctl status vsftpd |grep 'active (running)' >/dev/null
if [ $? -eq 0 ];then
echo "vsftpd服务器已启动..."
fi
port=$(netstat -anput | grep httpd | awk -F":" '{print $2}' | awk '{print $1}' |  sed ':a ; N;s/\n/ / ; t a ; ')
echo "vsftpd监听的端口是:$port"
ip=$(netstat -anput | grep httpd | awk '{print $4}'| awk -F ":" '{print $1}'| uniq | sed ':a ; N;s/\n/ / ; t a ; ')
echo "vsftpd监听的地址是:$ip"
pid=$(netstat -anput | grep httpd | awk '{print $7}' |awk -F"/" '{print $1}' | uniq | sed ':a ; N;s/\n/ / ; t a ; ')
echo "vsftpd的进程PID是:$pid"

--------------------------------------------------------------------------------------------------------------------------------------
8. 报警脚本，要求如下：
-------------------------------------------------------------------------------------------------------------------------------------
   根分区剩余空间小于20%
   内存已用空间大于80%
   向用户alice发送告警邮件
   配合crond每5分钟检查一次
 
#!/usr/bin/env bash
grep $0 /var/spool/cron/$(whoami) >/dev/null
if [ $? -eq 0 ];then
exit 2
else
echo " */5 * * * * /usr/bin/bash `pwd`/$0" >> /var/spool/cron/$(whoami)
fi
rpm -qa | grep mailx >/dev/null
if [ $? -eq 0 ];then
exit 1
else
yum install -y malix
fi
use=$(df -Th | grep -w "/" | awk '{print $6}' | awk -F "%" '{print $1}')
if [ $use -ge 80 ];then

echo "disk used 80%"| mali -s "disk" alice
fi

mem_used=$(free -m |grep Mem |awk '{print $3}')
mem_total=$(free -m |grep Mem |awk '{print $2}')
p=$(echo $mem_used/$mem_total| bc -l|cut -c 2-3)
if [ $p -ge 80 ];then

echo "mem used 80%"| mali -s "mem" alice

fi

-------------------------------------------------------------------------------------------------------------------------------------------------------- 
9. 判断用户输入的是否是数字
#!/usr/bin/env bash
read -p "input" n
if [ -z "$(echo $n | sed 's/[0-9]*//g')" ];then
echo "yes"
fi

--------------------------------------------------------------------------------------------------------------------------------------------------------
