#!/bin/bash


if [ ! -f "/var/www/wordpress/wp-config.php" ]
then
	mkdir -p /var/www/wordpress
	cd /var/www/wordpress

	wp --allow-root core download --path=/var/www/wordpress/ --locale=fr_FR

	wp --allow-root config create				--dbname="$DB_NAME" \
												--dbuser="$DB_USER_NAME" \
												--dbpass="$DB_USER_PASSWORD" \
												--dbhost="mariadb":"3306"

	wp --allow-root core install				--url="$WP_URL" \
												--title="$WP_TITLE" \
												--admin_user="$WP_ADMIN_NAME" \
												--admin_password="$WP_ADMIN_PASSWORD" \
												--admin_email="$WP_ADMIN_EMAIL"

	wp --allow-root user create					"$WP_USER_NAME" \
												"$WP_USER_EMAIL" \
												--user_pass="$WP_USER_PASSWORD"
fi

if [ -f "/var/www/wordpress/wp-config.php" ]
then
	chown -R www-data:www-data /var/www/wordpress/
	touch /tmp/started
	php-fpm7.4 -F
fi
