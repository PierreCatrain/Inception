#!/bin/bash

# 	sed -i "s/listen = \/run\/php\/php7.4-fpm.sock/listen = 9000/" "/etc/php/7.4/fpm/pool.d/www.conf";
# 	chown -R www-data:www-data /var/www/*;
# 	chown -R 755 /var/www/*;
# 	mkdir -p /run/php/;
# 	touch /run/php/php7.4-fpm.pid;

# if [ ! -f /var/www/html/wp-config.php ]; then
# 	echo "Wordpress: setting up..."
# 	mkdir -p /var/www/html
# 	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar;
# 	chmod +x wp-cli.phar; 
# 	mv wp-cli.phar /usr/local/bin/wp;
# 	cd /var/www/html;
# 	wp core download --allow-root;
# 	mv /var/www/wp-config.php /var/www/html/
# 	echo "Wordpress: creating users.."
# 	wp core install --allow-root --url=${DOMAIN_NAME} --title=${DATABASE_NAME} --admin_user=${ADMIN_NAME} --admin_password=${ADMIN_PASSWORD} --admin_email=${ADMIN_MAIL}
# 	wp user create --allow-root ${USER_NAME} ${USER_MAIL} --user_pass=${USER_PASSWORD};
# 	echo "Wordpress: set up!"
# fi

# exec "$@"

sleep 3

if wp core is-installed --path="/var/www/wordpress" --allow-root; then
    echo "WordPress est déjà configuré."
    exit 0
	# rm /var/www/wordpress/wp-config.php
fi

# Configure WordPress avec WP-CLI
echo "Installation de WordPress..."
wp core download --allow-root --path="/var/www/wordpress"
echo "la 1"

wp config create \
    --dbname="$DATABASE_NAME" \
    --dbuser="$USER_NAME" \
    --dbpass="$USER_PASSWORD" \
    --dbhost="mariadb:3306" \
    --path="/var/www/wordpress" \
    --allow-root

wp core install \
    --path="/var/www/wordpress" \
    --url="$DOMAIN_NAME" \
    --title="$DATABASE_NAME" \
    --admin_user="$ADMIN_NAME" \
    --admin_password="$ADMIN_PASSWORD" \
    --admin_email="$ADMIN_MAIL" \
    --allow-root

echo "la 2"

wp user create --allow-root ${USER_NAME} ${USER_MAIL} --user_pass=${USER_PASSWORD};

echo "Configuration réussie ! WordPress est prêt."