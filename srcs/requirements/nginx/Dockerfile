FROM debian:bullseye

RUN		apt-get update

RUN		apt-get install nginx -y

RUN     mkdir -p /etc/nginx/ssl
RUN     apt-get install openssl -y
RUN     openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=picatrai.42.fr/UID=pierre.catrain@protonmail.com"

RUN     mkdir -p /var/run/nginx
COPY    conf/nginx.conf /etc/nginx/conf.d/nginx.conf

RUN     chmod 755 /var/www/html
RUN     chown -R www-data:www-data /var/www/html
#RUN     cd /home && mkdir test
#COPY    tools/basix.html /home/test/

CMD ["nginx", "-g", "daemon off;"]
