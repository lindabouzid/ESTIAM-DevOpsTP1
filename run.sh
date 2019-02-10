#! /bin/sh

#start mysql server
/etc/init.d/mysql start

#create mysql table
mysql -u root -p"linda_mysql_pwd" -h localhost < create_table.sql

#start apache
/usr/sbin/apache2ctl -D FOREGROUND
