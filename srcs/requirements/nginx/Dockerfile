FROM    debian:bullseye

RUN		apt update -y
RUN     apt install openssl -y
RUN		apt install nginx -y

RUN     mkdir -p /etc/nginx/ssl
RUN     openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=picatrai.42.fr/UID=picatrai"

RUN     mkdir -p /var/run/nginx
COPY    conf/nginx.conf /etc/nginx/conf.d/nginx.conf

RUN     chmod 755 /var/www/html
RUN     chown -R www-data:www-data /var/www/html

CMD     ["nginx", "-g", "daemon off;"]