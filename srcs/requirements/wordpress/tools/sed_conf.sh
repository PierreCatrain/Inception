#!/bin/bash

sed -i "s/'votre_nom_de_bdd'/'${DB_DATABASE}'/" /var/www/wordpress/wp-config.php
sed -i "s/'votre_utilisateur_de_bdd'/'${DB_USER}'/" /var/www/wordpress/wp-config.php
sed -i "s/'votre_mdp_de_bdd'/'${DB_USER_PASSWORD}'/" /var/www/wordpress/wp-config.php
sed -i "s/'localhost'/'${DB_HOST}'/" /var/www/wordpress/wp-config.php
sed -i "s/'wp_'/'${DB_TABLE_PREFIX}'/" /var/www/wordpress/wp-config.php

# cat /var/www/wordpress/wp-config.php

/usr/sbin/php-fpm7.4 -F