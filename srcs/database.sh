echo "CREATE DATABASE Wordpress;"| mysql -u root --skip-password
echo "GRANT ALL PRIVILEGES ON Wordpress.* TO 'root'@'localhost' WITH GRANT OPTION;" mysql -u root --skip-password
echo "FLUSH PRIVILEGES;"| mysql -u root --skip-password
echo "set password for root@localhost=password('admin');"| mysql -u root --skip-password 