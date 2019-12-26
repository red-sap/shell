ansible mysql -m shell -a 'mysqldump -p'ZiHang@123' --all-databases --single-transaction  --master-data=2 --flush-logs >/backup/`date +%F-%H`-mysql-all.sq' -o
ansible mysql -m shell -a 'find /backup -mtime +10 -name "*.sq" -exec rm -rf {} \;' -o


spawn scp root@mysql:/backup/`date +%F-%H`-mysql-all.sq  /tmp/mysql.bak
expect {
 	  "yes/no" { send "yes\r";exp_continue }
      "password:" { send "ZiHang@123\r"} 
 }
expect eof
未完成
