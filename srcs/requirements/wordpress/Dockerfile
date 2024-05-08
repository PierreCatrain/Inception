FROM    debian:bullseye

RUN     apt-get update

RUN     apt-get install wget -y

RUN     apt-get install php7.4 -y
RUN     apt-get install php-fpm -y
RUN     apt-get install php-mysql -y
RUN     apt-get install mariadb-client -y

COPY /conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

RUN mkdir /run/php

COPY ./tools/wordpress.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/wordpress.sh
ENTRYPOINT ["/usr/local/bin/wordpress.sh"]

WORKDIR /var/www/html

CMD ["/usr/sbin/php-fpm7.4", "-F"]