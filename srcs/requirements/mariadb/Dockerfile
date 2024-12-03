FROM    debian:bullseye

EXPOSE  3306

RUN     apt update -y
RUN     apt install mariadb-server -y

COPY    conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY    tools/initial_db.sql /var/www/initial_db.sql

RUN     service mariadb start && mariadb < /var/www/initial_db.sql && rm -f /var/www/initial_db.sql;

CMD     ["mysqld"]