#!/bin/bash
set -e

apt update -y
apt install -y apache2 mysql-client php php-mysql libapache2-mod-php wget tar

systemctl enable apache2
systemctl start apache2

cd /tmp
wget https://wordpress.org/latest.tar.gz
tar -xzf latest.tar.gz

rm -f /var/www/html/index.html
cp -r wordpress/* /var/www/html/

chown -R www-data:www-data /var/www/html
chmod -R 755 /var/www/html

cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

sed -i "s/database_name_here/${db_name}/" /var/www/html/wp-config.php
sed -i "s/username_here/${db_username}/" /var/www/html/wp-config.php
sed -i "s/password_here/${db_password}/" /var/www/html/wp-config.php
sed -i "s/localhost/${db_host}/" /var/www/html/wp-config.php

systemctl restart apache2