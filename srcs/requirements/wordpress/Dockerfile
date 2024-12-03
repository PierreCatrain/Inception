FROM    debian:bullseye

EXPOSE  9000

RUN     apt update -y
RUN     apt install php7.4 -y
RUN     apt install php-mysqli -y
RUN     apt install php-fpm -y
RUN     apt install wget -y


COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf
COPY ./tools /var/www/

RUN     chmod +x /var/www/wordpress.sh

ENTRYPOINT [ "/var/www/wordpress.sh" ]

CMD ["/usr/sbin/php-fpm7.4", "--nodaemonize"]
