#!/usr/bin/env bash 
###
##
#
while :
do
cat <<-EOF
      +----------------------------+
      |         系统管理工具       |
      +----------------------------+
      |    a. 显示系统中用户数量   |
      |    2. 显示系统中进程数量   |
      |    3. 退出                 |
      +----------------------------+
EOF
read -p "please input your choose: " choose
case ${choose} in
 a)
       number=$(wc -l /etc/passwd)
       echo "User number ${number: 0: 2}"
       ;;
 2) 
       number=$(ps aux | wc -l)
       echo "Process number: ${number}"
	;;
 3)
	exit
	;;
 *)
	echo "Please choose in (a, 2, 3)"
esac
done
