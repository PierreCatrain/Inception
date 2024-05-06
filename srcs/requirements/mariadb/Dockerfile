FROM    debian:bullseye

RUN		apt-get update

RUN     apt-get install mariadb-server -y

COPY    conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY    /tools/mariadb.sh /usr/local/bin/mariadb.sh
RUN     chmod 755 /usr/local/bin/mariadb.sh

#RUN     ./usr/local/bin/mariadb.sh