FROM    debian:bullseye

RUN		apt update -y
RUN		apt install nginx -y
RUN     apt install openssl -y
RUN     apt install iputils-ping -y
RUN     rm -rf /var/lib/apt/lists/*

COPY    ./conf/nginx.conf    /etc/nginx/sites-available/picatrai.42.fr.conf

RUN     mkdir -p /etc/nginx/ssl
RUN     openssl req -x509 -nodes -days 365 -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=picatrai.42.fr/UID=picatrai"

RUN     ln -s /etc/nginx/sites-available/picatrai.42.fr.conf /etc/nginx/sites-enabled/picatrai.42.fr.conf

EXPOSE 443

STOPSIGNAL SIGQUIT

CMD ["nginx", "-g", "daemon off;"]
