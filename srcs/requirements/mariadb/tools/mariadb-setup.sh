#!/bin/bash

if [ ! -d "/var/lib/mysql/$DB_NAME" ]
then

	service mariadb start
	sleep 2

	mariadb --execute "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password USING PASSWORD ('$DB_ROOT_PASSWORD');"
	mariadb -u root -p$DB_ROOT_PASSWORD --execute "CREATE DATABASE IF NOT EXISTS $DB_NAME;"
	mariadb -u root -p$DB_ROOT_PASSWORD --execute "CREATE USER IF NOT EXISTS '$DB_USER_NAME'@'%' IDENTIFIED WITH mysql_native_password USING PASSWORD ('$DB_USER_PASSWORD');"
	mariadb -u root -p$DB_ROOT_PASSWORD --execute "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER_NAME'@'%';"

	mariadb-admin -u root -p$DB_ROOT_PASSWORD shutdown
	sleep 2
fi

if [ -d "/var/lib/mysql/$DB_NAME" ]
then
	touch /tmp/started
	mariadbd
fi
