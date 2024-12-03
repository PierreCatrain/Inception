FROM    debian:bullseye

EXPOSE  3306

RUN     apt update -y
RUN     apt install mariadb-server -y

COPY    conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY    tools/mariadb.sh /mariadb.sh

RUN     chmod +x mariadb.sh
RUN     ./mariadb.sh

CMD     ["mysqld"]