FROM debian:bullseye

RUN apt update -y
RUN apt install curl -y 
RUN apt install php -y
RUN apt install php-fpm -y
RUN apt install php-mysql -y
RUN apt install mariadb-client -y
RUN mkdir -p /run/php
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
RUN wp cli update

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/

COPY --chmod=0755 /tools/entrypoint.sh /usr/local/bin

EXPOSE 9000

ENTRYPOINT ["./usr/local/bin/entrypoint.sh"]