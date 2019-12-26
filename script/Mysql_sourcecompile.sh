#!/usr/bin/env bash
###
# Mysql source compile install  for shell
#升级gcc
yum -y install gcc make zlib-devel pcre pcre-devel openssl-devel
yum -y install centos-release-scl
yum -y install devtoolset-7-gcc devtoolset-7-gcc-c++ devtoolset-7-binutils openssl ncurses ncurses-devel  make
scl enable devtoolset-7 bash
#退出后还是回复原系统的gcc需要执行
echo "source /opt/rh/devtoolset-7/enable" >>/etc/profile #添加环境变量
echo "#############################升级gcc完成######################"
#上传cmake源码包
tar xvf /tmp/cmake-3.15.4.tar.gz #加绝对路径
cd /tmp/cmake-3.15.4
./configure --prefix=/usr/local/cmake
make && make install 
ln -s /usr/local/cmake/bin/cmake /usr/bin/cmake 
echo "#############################cmake编译安装完成#################"

yum install -y ncurses-devel

tar xvf mysql-boost-8.0.18.tar.gz
cd mysql-8.0.18/

mkdir /etc/mysql-8.0.18/bld
cd /etc/mysql-8.0.18/bld
/usr/local/cmake-3.15.e3/bin/cmake .. \
-DWITH_BOOST=/tmp/mysql8/mysql-8.0.18/boost \
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
-DWITH_INNOBASE_STORAGE_ENGINE=1 \
-DFORCE_INSOURCE_BUILD=1
#报错 ：Cannot find appropriate system libraries for WITH_SSL=system.
#Make sure you have specified a supported SSL version. 
#Valid options are : 
#system (use the OS openssl library), 
#yes (synonym for system), 
#</path/to/custom/openssl/installation>, 
#wolfssl (use wolfSSL. See extra/README-wolfssl.txt on how to set this up)

#返回上层目录
cd.. 
make && make install
groupadd mysql
useradd -r -g mysql -s /bin/false mysql
chown -R mysql.mysql /usr/local/mysql #修改文件的属主和属组 
NTla4kXeV7&g  ZiHang@123
/usr/local/mysql/bin/mysqld --initialize --user=mysql --basedir=/usr/local/mysql --datadir=/usr/local/mysql/data #初始化数据库注意保存密码
/usr/local/mysql/bin/mysql_ssl_rsa_setup --datadir=/usr/local/mysql/data #加密数据库数据库文件
vim /etc/my.cnf
[mysqld]
basedir=/usr/local/mysql
datadir=/usr/local/mysql/data

cp /usr/local/mysql/support-files/mysql.server /etc/init.d/mysqld
chkconfig --add mysqld #添加mysql 服务
chkconfig mysqld on # 自动启动mysql 服务
service mysqld start
echo "export PATH=$PATH:/usr/local/mysql/bin" >> /etc/profile
/usr/local/mysql/bin/mysql -u root -p'x/dwiQ2<l:hb'
/usr/local/mysql/bin/mysqladmin -u root -p 'x/dwiQ2<l:hb' password 'QinFeng@123'

