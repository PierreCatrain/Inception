#!/bin/sh

#check if wp-config.php exist
if [ -f ./wp-config.php ]
then
	echo "wordpress already downloaded"
else

	wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz
	tar -xvf wordpress-6.0-fr_FR.tar.gz
	mv wordpress/* .
	rm -rf wordpress

	sed -i "s/votre_utilisateur_de_bdd/$SQL_USER/g" wp-config-sample.php
	sed -i "s/votre_mdp_de_bdd/$SQL_PASSWORD/g" wp-config-sample.php
	sed -i "s/localhost/$SQL_HOSTNAME/g" wp-config-sample.php
	sed -i "s/votre_nom_de_bdd/$SQL_DATABASE/g" wp-config-sample.php
	mv wp-config-sample.php wp-config.php
fi

exec "$@"