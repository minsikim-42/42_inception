# # !/bin/bash

# /etc/init.d/php7.3-fpm start

# # -e : file exist?
# if [ ! -e /usr/local/bin/wp ]; then
# 	curl -O https://raw.gethubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
# 	chmod +x wp-cli.phar
# 	mv wp-cli.phar /usr/local/bin/wp
# 	wp --info
# 	wp core download --allow-root --version=5.8.1 --path=/var/www/html
# 	wp config create --allow-root --dbname=wordpress --dbuser=$MARIADB_USER --dbpass=$MARIADB_PASSWORD --dbhost=mariadb:3306 --path=/var/www/html
# 	wp core install --allow-root --path=/var/www/html --url=https://$DOMAIN_NAME --title=Inception --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL
# 	wp user create --allow-root $WP_USER $WP_USER_EMAIL --user_pass=$WP_USER_PASSWORD --role=author --path=/var/www/html
# fi

# exec /usr/sbin/php-fpm7.3 -F

#!/bin/bash

/etc/init.d/php7.3-fpm start

if [ ! -e /usr/local/bin/wp ]; then
	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	chmod +x wp-cli.phar
	mv wp-cli.phar /usr/local/bin/wp
fi

if [ ! -e /var/www/html/wp-config.php ]; then
	wp core download --allow-root --version=5.8.1 --path=/var/www/html
	wp config create --allow-root --dbname=wordpress --dbuser=$MARIADB_USER --dbpass=$MARIADB_PASSWORD --dbhost=mariadb:3306 --path=/var/www/html
	wp core install --allow-root --path=/var/www/html --url=https://$DOMAIN_NAME --title=Inception --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL
	wp user create --allow-root $WP_USER $WP_USER_EMAIL --user_pass=$WP_USER_PASSWORD --role=author --path=/var/www/html
fi

/etc/init.d/php7.3-fpm status
/etc/init.d/php7.3-fpm stop

exec /usr/sbin/php-fpm7.3 -F