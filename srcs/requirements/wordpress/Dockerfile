# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: edelarbr <edelarbr@student.42mulhouse.fr>  +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/05/05 17:36:29 by edelarbr          #+#    #+#              #
#    Updated: 2024/05/08 17:31:49 by edelarbr         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:bullseye

EXPOSE 9000

RUN apt update -y
RUN apt upgrade -y

RUN apt install wget -y
RUN apt install tar -y
RUN apt install php7.4-fpm -y
RUN apt install php7.4-mysql -y
RUN apt install mariadb-client -y

# Wordpress installation
# RUN wget https://fr.wordpress.org/wordpress-6.5-fr_FR.tar.gz -P /var/www
# RUN tar -xzf /var/www/wordpress-6.5-fr_FR.tar.gz -C /var/www
# RUN rm /var/www/wordpress-6.5-fr_FR.tar.gz
# RUN chown -R root:root /var/www/wordpress


# Modify php configuratin file
COPY conf/www.conf /etc/php/7.4/fpm/pool.d/
# RUN chown www-data:www-data /etc/php/7.4/fpm/pool.d/www.conf
# RUN	sed -i "s/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/g" /etc/php/7.4/fpm/php.ini
# RUN sed -i "s/listen = \/run\/php\/php$PHP_VERSION_ENV-fpm.sock/listen = 9000/g" /etc/php/7.4/fpm/pool.d/www.conf
# RUN sed -i "s/;listen.mode = 0660/listen.mode = 0660/g" /etc/php/7.4/fpm/pool.d/www.conf
# RUN sed -i "s/;daemonize = yes/daemonize = no/g" /etc/php/7.4/fpm/pool.d/www.conf


# Install WP-CLI
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -P /usr/bin/
RUN chmod +x /usr/bin/wp-cli.phar
RUN mv /usr/bin/wp-cli.phar /usr/bin/wp
# RUN mkdir -p /var/www/.wp-cli/cache

# Wordpress requirements
RUN	mkdir -p /run/php/
RUN mkdir -p /var/run/php/
RUN mkdir -p /var/www/inception/

RUN	chown -R www-data:www-data /var/www/inception/


# Wordpress setup
COPY ./tools/auto-config.sh /bin/
RUN chmod +x /bin/auto-config.sh

ENTRYPOINT [ "auto-config.sh" ]
