echo "CREATE DATABASE Wordpress;"| mysql -u root --skip-password
echo "GRANT ALL PRIVILEGES ON Wordpress.* TO 'root'@'localhost' WITH GRANT OPTION;"| mysql -u root --skip-password
echo "SET PASSWORD FOR root@localhost=password('admin');"| mysql -u root --skip-password