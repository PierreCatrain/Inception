FROM    debian:bullseye

RUN     apt-get update

RUN     apt-get install wget -y

RUN     apt-get install php7.4 -y
RUN     apt-get install php-fpm -y
RUN     apt-get install php-mysql -y
RUN     apt-get install mariadb-client -y

RUN     wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www
RUN     cd /var/www && tar -xvf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz
RUN		chown -R root:root /var/www/wordpress

COPY    conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

COPY    /tools/wordpress.sh /usr/local/bin/wordpress.sh
RUN     chmod 755 /usr/local/bin/wordpress.sh
RUN     ./usr/local/bin/wordpress.sh

RUN     mkdir /run/php

WORKDIR /var/www/html


#RUN     rm /var/www/wordpress/wp-config-sample.php
#COPY    conf/wp-config.php /var/www/wordpress/wp-config.php

#RUN     curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
#  && chmod +x wp-cli.phar \
#  && mv wp-cli.phar /usr/local/bin/wp





#RUN apt-get install -y dnsutils
CMD ["/usr/sbin/php-fpm7.4", "-F"]

