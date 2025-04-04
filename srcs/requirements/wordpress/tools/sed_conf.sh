#!/bin/bash

sleep 10

# on reconfigure a chaque fois ??
sed -i "s/'votre_nom_de_bdd'/'${DB_DATABASE}'/" /var/www/wordpress/wp-config.php
sed -i "s/'votre_utilisateur_de_bdd'/'${DB_USER}'/" /var/www/wordpress/wp-config.php
sed -i "s/'votre_mdp_de_bdd'/'${DB_USER_PASSWORD}'/" /var/www/wordpress/wp-config.php
sed -i "s/'localhost'/'${DB_HOST}'/" /var/www/wordpress/wp-config.php
sed -i "s/'wp_'/'${DB_TABLE_PREFIX}'/" /var/www/wordpress/wp-config.php

# cat /var/www/wordpress/wp-config.php


# wp user create \
#         --allow-root \
#         --dbname="$DB_DATABASE" \
#         --dbuser="$WP_USER" \
#         --dbpass="$WP_USER_PASSWORD" \
#         --dbhost=mariadb:3306 --path="$WP_PATH"

# echo "1"

cd /var/www/wordpress

wp core install \
        --path="$WP_PATH" \
        --url="$DOMAIN_NAME" \
        --title="$WP_TITLE" \
        --admin_user="$WP_ADMIN" \
        --admin_password="$WP_ADMIN_PASSWORD" \
        --admin_email="$WP_ADMIN_EMAIL" \
        --allow-root

echo "2"

wp user create --allow-root "$WP_USER" "$WP_USER_EMAIL" --user_pass="$WP_USER_PASSWORD" --porcelain

/usr/sbin/php-fpm7.4 -F

