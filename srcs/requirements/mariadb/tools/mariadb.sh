#!/bin/sh

#mysql_install_db
mysql_upgrade
#/etc/init.d/mysql start
#service mysql start

#Check if the database exists

if [ -d "/var/lib/mysql/$MYSQL_DATABASE" ]
then 

	echo "Database already exists"
else

# Set root option so that connexion without root password is not possible

mysql_secure_installation << _EOF_

Y
root4life
root4life
Y
n
Y
Y
_EOF_

#Add a root user on 127.0.0.1 to allow remote connexion 
#Flush privileges allow to your sql tables to be updated automatically when you modify it
#mysql -uroot launch mysql command line client
echo "GRANT ALL ON *.* TO 'root'@'%' IDENTIFIED BY '$SQL_ROOT_PASSWORD'; FLUSH PRIVILEGES;" | mysql -uroot

#Create database and user in the database for wordpress

echo "CREATE DATABASE IF NOT EXISTS $SQL_DATABASE; GRANT ALL ON $SQL_DATABASE.* TO '$SQL_USER'@'%' IDENTIFIED BY '$SQL_PASSWORD'; FLUSH PRIVILEGES;" | mysql -u root

#Import database in the mysql command line
mysql -uroot -p$SQL_ROOT_PASSWORD $SQL_DATABASE < /usr/local/bin/wordpress.sql

fi

service mysql stop
#/etc/init.d/mysql stop

exec "$@"





##!/bin/sh
#
#mysql_upgrade
#
##/etc/init.d/mysql start
#service mysql start
#
#mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"
#
#mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"
#
#mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
#
#mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
#
#mysql -e "FLUSH PRIVILEGES;"
#
#mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown
#
#exec mysqld --bind-address=0.0.0.0