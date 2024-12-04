#!/bin/bash

sleep 10

if [ ! -f /var/www/wordpress/wp-config.php ]; then
    wp config create	--allow-root \
                        --dbname=$DATABASE_NAME \
                        --dbuser=$USER_NAME \
                        --dbpass=$USER_PASSWORD \
                        --dbhost=mariadb:3306 --path='/var/www/wordpress'

fi
