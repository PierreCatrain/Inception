FROM debian:bullseye

RUN apt-get update
RUN apt-get -y install php7.4 php-mysqli php-fpm wget sendmail


COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d
COPY ./tools /var/www/

RUN chmod +x /var/www/wordpress.sh

ENTRYPOINT [ "/var/www/wordpress.sh" ]

CMD ["/usr/sbin/php-fpm7.4", "--nodaemonize"]
