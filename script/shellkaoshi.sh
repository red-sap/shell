#!/usr/bin/env bash
for ip in $(seq 255); do
{
ping -c1 -s0.5 10.18.40.${ip} &>/dev/null
if [ $? -eq 0 ];then
    echo   10.18.40.${ip} >> onlineComputer.txt
  else
    echo   10.18.40.${ip} >> offlineComputer.txt
   fi
}&
done
wait
echo "complete !"
echo "########################第一题###############################"
#!/usr/bin/env bash
for i in $(seq 100);do
useradd user${i}
echo "hlions" | passwd --stdin user${i}
done
echo "########################第13题###############################"
#!/usr/bin/env bash
while :
do
        clear
  cat <<-EOF
        +----------------------------+
        |         创建用户向导        |
        +----------------------------+
        |      请输入要创建的用户    |
        |      请输入用户的uid       |
        |  用户是否需要交互的shell   |
        +----------------------------+
EOF
  read -p "Please input your username: " username
  read -p "Please input your uid: " uid
  read -p "Please input your shell(yes/no): " shell
  if [ ${shell} -eq yes  ];then
  useradd ${username} -u ${uid}
  p
  else
  useradd ${username} -u ${uid} -s /sbin/nologin
   cat <<-EOF
        +----------------------------+
        |         选择组             |
        +----------------------------+
        |      root                  |
        |      admin                 |
        |  group1                    |
        +----------------------------+
EOF
  read -p "Please input your group: " group
  case ${group} in
	1)
		gpasswd -a ${username} root
		;;
	2)
		gpasswd -a ${username} admin
		;;
	3)
		gpasswd -a ${username} group1
		;;
	*)
		echo "please 1 or 2 or 3, your can!"
esac
fi
done
echo "########################第14题###############################"
#!/usr/bin/env bash
kill=$(ps aux | grep httpd | awk '{print $2}')
for i in  ${kill}; do
 kill -9 ${i}
done        
echo "########################第15题###############################"
