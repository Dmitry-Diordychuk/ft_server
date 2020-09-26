service mysql start
bash ./srcs/database.sh
service php7.3-fpm start
ln -s /usr/share/phpmyadmin /data/www
ln -s /etc/nginx/sites-available/mynginx.conf /etc/nginx/sites-enabled/
unlink /etc/nginx/sites-enabled/default
service nginx start

while true
do 
sleep 1
done