#!/bin/bash

mkdir -p /var/www/
mkdir -p /var/www/html

# if [ ! -d "/var/www/" ]; then
#   mkdir /var/www/
# fi
# if [ ! -d "/var/www/html" ]; then
#   mkdir /var/www/html
# fi

cd /var/www/html

#rm -rf *

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 

chmod +x wp-cli.phar 

mv wp-cli.phar /usr/local/bin/wp

wp core download --allow-root

mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

cp /wp-config.php /var/www/html/wp-config.php

apt-get install php-xmlreader php-curl -y

chmod -R 755 /var/www/html/wp-content
chown -R www-data:www-data /var/www/html

sed -i -r "s/db1/$db1_name/1"   /var/www/html/wp-config.php
sed -i -r "s/user/$db1_user/1"  /var/www/html/wp-config.php
sed -i -r "s/pwd/$db1_pwd/1"    /var/www/html/wp-config.php

wp core install --url=$DOMAIN_NAME/ --title=$WP_TITLE --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root
wp user create $WP_USR $WP_EMAIL --role=author --user_pass=$WP_PWD --allow-root

wp theme activate twentytwentytwo --allow-root

sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 9000/g' /etc/php/7.4/fpm/pool.d/www.conf

echo "DATE: $(date)" >> x.txt
mkdir /run/php
/usr/sbin/php-fpm7.4 -F

#tail -f /dev/null