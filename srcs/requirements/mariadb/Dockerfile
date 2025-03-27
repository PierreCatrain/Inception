FROM    debian:bullseye

EXPOSE  3306

RUN     apt update -y
RUN     apt upgrade -y
RUN     apt install mariadb-server -y

COPY    conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

COPY    tools/init_db.sh   /init_db.sh
RUN     chmod +x /init_db.sh

CMD     ["/init_db.sh"]