wget http://ftp.gnu.org/gnu/gcc/gcc-5.3.0/gcc-5.3.0.tar.gz
tar -zxf gcc-5.3.0.tar.gz
yum install -y gcc-c++-4.8.5-39.el7.x86_64
yum -y install gcc make zlib-devel pcre pcre-devel openssl-devel
#GMP 4.2+, MPFR 2.4.0+ and MPC 0.8.0+.
wget ftp://gcc.gnu.org/pub/gcc/infrastructure/gmp-4.3.2.tar.bz2
#安装 bzip2
yum -y install bzip2
tar jxvf gmp-4.3.2.tar.bz2
./configure --prefix=/usr/local/gmp-4.3.2
#checking for suitable m4... configure: error: No usable m4 in $PATH or /usr/5bin (see config.log for reasons).
yum install -y m4
make && make install
#第一个包安装完成
wget ftp://gcc.gnu.org/pub/gcc/infrastructure/mpfr-2.4.2.tar.bz2
tar jxvf mpfr-2.4.2.tar.bz2
cd mpfr-2.4.2
#关联 第一个包
./configure --prefix=/usr/local/mpfr-2.4.2 --with-gmp=/usr/local/gmp-4.3.2
make && make install
wget ftp://gcc.gnu.org/pub/gcc/infrastructure/mpc-0.8.1.tar.gz
tar -zxf mpc-0.8.1.tar.gz
cd mpc-0.8.1
./configure --prefix=/usr/local/mpc-0.8.1 --with-gmp=/usr/local/gmp-4.3.2 --with-mpfr=/usr/local/mpfr-2.4.2
make && make install 
cd gcc-5.3.0
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/mpc-0.8.1/lib:/usr/local/gmp-4.3.2/lib:/usr/local/mpfr-2.4.2/lib
/configure --prefix=/usr/local/gcc-5.3.0 -enable-threads=posix -disable-checking -disable-multilib -enable-languages=c,c++ --with-gmp=/usr/local/gmp-4.3.2 --with-mpfr=/usr/local/mpfr-2.4.2 --with-mpc=/usr/local/mpc-0.8.1
make && make install 

vi /etc/bashrc
百度设置gcc的环境变量
需要更换、use bin 下的文件
备份之前的gcc  
ln -s /usr/local/gcc-5.3.0/bin/gcc /usr/bin/gcc
ln -s /usr/local/gcc-5.3.0/bin/gcc-ar /usr/bin/gcc-ar
ln -s /usr/local/gcc-5.3.0/bin/gcc-nm /usr/bin/gcc-nm
ln -s /usr/local/gcc-5.3.0/bin/gcc-ranlib /usr/bin/gcc-ranlib
ln -s /usr/local/gcc-5.3.0/bin/g++ /usr/bin/g++
#c++: error: unrecognized command line option ‘-std=c++14’
#DCMAKE_CXX_COMPILER=/usr/local/gcc-5.3.0/bin//g++
#编译时添加选项
[root@localhost mysql]# service mysqld start
/usr/local/mysql/bin/my_print_defaults: /lib64/libstdc++.so.6: version `GLIBCXX_3.4.21' not found (required
/usr/local/mysql/bin/my_print_defaults: /lib64/libstdc++.so.6: version `CXXABI_1.3.9' not found (required b
/usr/local/mysql/bin/my_print_defaults: /lib64/libstdc++.so.6: version `GLIBCXX_3.4.20' not found (required
Starting MySQL./usr/local/mysql/bin/my_print_defaults: /lib64/libstdc++.so.6: version `GLIBCXX_3.4.21' not 
/usr/local/mysql/bin/my_print_defaults: /lib64/libstdc++.so.6: version `CXXABI_1.3.9' not found (required b
/usr/local/mysql/bin/my_print_defaults: /lib64/libstdc++.so.6: version `GLIBCXX_3.4.20' not found (required
/usr/local/mysql/bin/my_print_defaults: /lib64/libstdc++.so.6: version `GLIBCXX_3.4.21' not found (required
/usr/local/mysql/bin/my_print_defaults: /lib64/libstdc++.so.6: version `CXXABI_1.3.9' not found (required b
/usr/local/mysql/bin/my_print_defaults: /lib64/libstdc++.so.6: version `GLIBCXX_3.4.20' not found (required
Logging to '/usr/local/mysql/data/localhost.err'.
 ERROR! The server quit without updating PID file (/usr/local/mysql/data/localhost.pid).
[root@localhost mysql]# cd /usr/local/mysql/bin

解决方案
ln -s /usr/local/gcc-5.3.0/lib64/libstdc++.so.6.0.21 /usr/lib64/libstdc++.so.6