FROM    debian:bullseye

EXPOSE  3306

RUN     apt update -y
RUN     apt install mariadb-server -y

COPY    conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf


COPY    tools/mariadb.sh /mariadb.sh
RUN     chmod +x mariadb.sh
CMD     ["./mariadb.sh"]



# COPY    tools/passur.sh /passur.sh

# RUN     chmod +x passur.sh
# RUN     ./mariadb.sh

# CMD     ["mysqld"]
# CMD     ["./passur.sh"]

# COPY tools/init.sql /docker-entrypoint-initdb.d/




# COPY    tools/init.sql /var/www/init.sql
# RUN     service mariadb start && mariadb < /var/www/init.sql && rm -f /var/www/init.sql


# CMD ["mysqld"]