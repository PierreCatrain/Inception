FROM    debian:bullseye

RUN		apt-get update

RUN     apt-get install mariadb-server -y
RUN     apt-get install mariadb-client -y

COPY    conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY    /tools/mariadb.sh /usr/local/bin/mariadb.sh
RUN     chmod 755 /usr/local/bin/mariadb.sh

#COPY    conf/wordpress.sql /usr/local/bin/
#RUN chmod +x /usr/local/bin/wordpress.sql

ENTRYPOINT ["./usr/local/bin/mariadb.sh"]

CMD     ["mysqld", "--bind-address=0.0.0.0"]