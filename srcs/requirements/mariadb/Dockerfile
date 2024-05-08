FROM    debian:bullseye

RUN		apt-get update
RUN     apt upgrade -y

RUN apt-get install -y mariadb-server \
    mariadb-client \
    vim \
    && rm -rf /var/lib/apt/lists/*

RUN     apt-get install mariadb-server -y
RUN     apt-get install mariadb-client -y

#COPY    conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./conf/wordpress.sql /usr/local/bin/
RUN chmod +x /usr/local/bin/wordpress.sql

COPY    /tools/mariadb.sh /usr/local/bin/
RUN     chmod 755 /usr/local/bin/mariadb.sh

RUN mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld && chmod 777 /run/mysqld

#RUN chown -R mysql:mysql /var/lib/mysql && chmod 777 /var/lib/mysql


ENTRYPOINT ["./usr/local/bin/mariadb.sh"]

CMD     ["mysqld", "--bind-address=0.0.0.0"]