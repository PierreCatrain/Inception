#!/bin/bash

mysqld_safe &

until mysqladmin ping --silent; do
    sleep 1
done

echo "CREATE DATABASE IF NOT EXISTS $DATABASE_NAME ;" > db.sql
echo "CREATE USER IF NOT EXISTS '$USER_NAME'@'%' IDENTIFIED BY '$USER_PASSWORD' ;" >> db.sql
echo "GRANT ALL PRIVILEGES ON $DATABASE_NAME.* TO '$USER_NAME'@'%' ;" >> db.sql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$ADMIN_PASSWORD' ;" >> db.sql
echo "FLUSH PRIVILEGES;" >> db.sql

mysql < db.sql

kill $(cat /var/run/mysqld/mysqld.pid)

mysqld
