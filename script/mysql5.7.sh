#!/usr/bin/env bash
#use install -y mysql
yum -y install ncurses ncurses-devel openssl-devel bison gcc gcc-c++ make cmake
#上传mysql 和boost包
groupadd mysql
useradd -r -g mysql -s /bin/false mysql
tar xf boost_1_59_0.tar.gz
tar xf mysql-5.7.19.tar.gz
mv /tmp/boost_1_59_0 mysql-5.7.19/
cd /tmp/mysql-5.7.19
cmake . \
-DWITH_BOOST=boost_1_59_0/ \
-DCMAKE_INSTALL_PREFIX=/usr/local/mysql \
-DSYSCONFDIR=/etc \
-DMYSQL_DATADIR=/usr/local/mysql/data \
-DINSTALL_MANDIR=/usr/share/man \
-DMYSQL_TCP_PORT=3306 \
-DMYSQL_UNIX_ADDR=/tmp/mysql.sock \
-DDEFAULT_CHARSET=utf8 \
-DEXTRA_CHARSETS=all \
-DDEFAULT_COLLATION=utf8_general_ci \
-DWITH_READLINE=1 \
-DWITH_SSL=system \
-DWITH_EMBEDDED_SERVER=1 \
-DENABLED_LOCAL_INFILE=1 \
-DWITH_INNOBASE_STORAGE_ENGINE=1
make && make install
mkdir /usr/local/mysql/mysql-files
/usr/local/mysql/bin/mysqld --initialize --user=mysql --basedir=/usr/local/mysql --datadir=/usr/local/mysql/data &> ./password
/usr/local/mysql/bin/mysql_ssl_rsa_setup --datadir=/usr/local/mysql/data
mv /etc/my.cnf /etc/my.cnf.bak
touch /etc/my.cnf
echo "[mysqld]" > /etc/my.cnf
echo "basedir=/usr/local/mysql" >> /etc/my.cnf
echo "datadir=/usr/local/mysql/data" >> /etc/my.cnf
cp /usr/local/mysql/support-files/mysql.server /etc/init.d/mysqld
chkconfig --add mysqld
chkconfig mysqld on
service mysqld start






bash  -xv 调试脚本语句
/usr/local/mysql/bin/mysql -u root -p'aK*Hq(ajC1co'
set password for 用户名@localhost = password(‘新密码’);