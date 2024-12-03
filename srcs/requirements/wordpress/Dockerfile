FROM    debian:bullseye

EXPOSE  9000

RUN     apt update -y
RUN     apt install php7.4 -y
RUN     apt install php-mysql -y
RUN     apt install php-fpm -y
RUN     apt install wget -y


# COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf
# COPY ./tools /var/www/

# RUN     chmod +x /var/www/wordpress.sh

# ENTRYPOINT [ "/var/www/wordpress.sh" ]

# CMD ["/usr/sbin/php-fpm7.4", "--nodaemonize"]

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

RUN     wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www
RUN     cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz
RUN		chown -R root:root /var/www/wordpress









RUN mkdir -p /run/php && chown -R www-data:www-data /run/php
# RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
#     chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp


CMD ["/usr/sbin/php-fpm7.4", "--nodaemonize"]