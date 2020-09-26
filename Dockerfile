FROM debian:buster

RUN mkdir -p /usr/my_working_dir
RUN mkdir -p /data/www
WORKDIR /usr/my_working_dir
COPY . /usr/my_working_dir

RUN apt-get -yqq update
RUN apt-get -yqq upgrade
RUN apt-get -yqq install wget

#MySQL
RUN DEBIAN_FRONTEND=noninteractive apt-get -yqq install mariadb-server

#php-fpm
RUN apt-get -yqq install php7.3 php-mysql php-fpm php-pdo php-gd php-cli php-mbstring
#phpmyadmin
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.2/phpMyAdmin-5.0.2-all-languages.tar.gz
RUN tar -xf phpMyAdmin-5.0.2-all-languages.tar.gz
RUN mv phpMyAdmin-5.0.2-all-languages/ /usr/share/phpmyadmin
RUN mv ./srcs/config.inc.php /usr/share/phpmyadmin

#wordpress
RUN wget https://wordpress.org/latest.tar.gz
RUN tar -xzvf latest.tar.gz
RUN mv wordpress/ /data/www
COPY ./srcs/wp-config.php /data/www/wordpress

#nginx
RUN apt-get -yqq install nginx
COPY ./srcs/mynginx.conf /etc/nginx/sites-available/

#ssl
RUN openssl req -x509 -nodes -days 365 -subj "/C=RU/ST=Russia/L=Moscow/O=my/OU=my/CN=kdustin" -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt

EXPOSE 80
EXPOSE 443

#on run
CMD ["/bin/bash", "./srcs/run.sh", "start"]