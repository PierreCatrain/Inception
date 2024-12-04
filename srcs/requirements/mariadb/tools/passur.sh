#!/bin/bash

# mysqld_safe --datadir=/var/lib/mysql &
echo "bonjour"
mysqld_safe &

mysql -e "CREATE DATABASE IF NOT EXISTS \`${DATABASE_NAME}\`;"
mysql -e "CREATE USER IF NOT EXISTS \`${USER_NAME}\`@'localhost' IDENTIFIED BY '${USER_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON \`${DATABASE_NAME}\`.* TO \`${USER_NAME}\`@'%' IDENTIFIED BY '${USER_PASSWORD}';"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${ADMIN_PASSWORD}';"
mysql -e "FLUSH PRIVILEGES;"

mysqladmin -u root -p$ADMIN_PASSWORD shutdown
exec mysqld_safe

# mysqld_safe --datadir=/var/lib/mysql &
