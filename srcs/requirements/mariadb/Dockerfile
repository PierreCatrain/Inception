FROM    debian:bullseye

RUN     apt update -y
RUN     apt install mariadb-server -y
RUN     apt clean
RUN     apt --yes --quiet autoremove --purge
RUN     rm -rf /var/lib/apt/lists/*

COPY    --chmod=0755 ./tools/mariadb.sh /usr/local/bin/

EXPOSE 3306

ENTRYPOINT ["/usr/local/bin/mariadb.sh"]