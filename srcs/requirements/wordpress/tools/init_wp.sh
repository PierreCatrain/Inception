#!/bin/bash

cp wp-config-sample.php wp-config.php

# Remplacer les valeurs dans wp-config.php
sed -i "s/'votre_nom_de_bdd'/'${DB_NAME}'/" wp-config.php
sed -i "s/'votre_utilisateur_de_bdd'/'${DB_USER}'/" wp-config.php
sed -i "s/'votre_mdp_de_bdd'/'${DB_PASSWORD}'/" wp-config.php
sed -i "s/'localhost'/'${DB_HOST}'/" wp-config.php

# Générer et insérer les clés secrètes
SALT=$(curl -s https://api.wordpress.org/secret-key/1.1/salt/)
sed -i "/AUTH_KEY/d;/SECURE_AUTH_KEY/d;/LOGGED_IN_KEY/d;/NONCE_KEY/d;/AUTH_SALT/d;/SECURE_AUTH_SALT/d;/LOGGED_IN_SALT/d;/NONCE_SALT/d" wp-config.php
sed -i "/^define( 'DB_COLLATE'/a $SALT" wp-config.php

# Lancer PHP-FPM ou Apache selon ton conteneur
exec php-fpm