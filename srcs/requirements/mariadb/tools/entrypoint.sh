#!/bin/bash

chown -R mysql:mysql /var/lib/mysql
mysql_install_db

/usr/share/mysql/mysql.server start

mysql -u root -p"$MYSQL_ROOT_PASSWORD" <<-EOSQL
	USE mysql;
	SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$MYSQL_ROOT_PASSWORD');
	CREATE DATABASE IF NOT EXISTS wordpress;
	CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
	GRANT ALL PRIVILEGES ON wordpress.* TO '$MYSQL_USER'@'%' WITH GRANT OPTION;
	FLUSH PRIVILEGES;
EOSQL

/usr/share/mysql/mysql.server status
mysqladmin --user=root --password=$MYSQL_ROOT_PASSWORD shutdown

exec /usr/bin/mysqld_safe --datadir='/var/lib/mysql'