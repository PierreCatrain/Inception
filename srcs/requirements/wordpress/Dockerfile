FROM    debian:bullseye

EXPOSE  9000

RUN     apt update -y
RUN     apt install php7.4 -y
RUN     apt install php-mysql -y
RUN     apt install php-fpm -y
RUN     apt install wget -y
RUN     apt install mariadb-client -y


RUN     apt install sendmail -y


RUN     wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www
RUN     cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz
RUN		chown -R root:root /var/www/wordpress

COPY    conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

COPY    tools/wp-config.php /var/www/wordpress/wp-config.php

COPY    tools/sed_conf.sh /sed_conf.sh
RUN     chmod +x sed_conf.sh

RUN     mkdir -p /run/php && chown -R www-data:www-data /run/php


RUN     wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN     chmod +x wp-cli.phar
RUN     mv wp-cli.phar /usr/local/bin/wp



CMD     ["/sed_conf.sh"]

