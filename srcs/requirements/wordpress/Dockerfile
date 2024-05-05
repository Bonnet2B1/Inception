# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: edelarbr <edelarbr@student.42mulhouse.fr>  +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/05/05 17:36:29 by edelarbr          #+#    #+#              #
#    Updated: 2024/05/05 23:17:48 by edelarbr         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:bullseye

EXPOSE 9000

RUN apt update -y
RUN apt upgrade -y

RUN apt install wget -y
RUN apt install php7.4-fpm -y
RUN apt install php7.4-mysql -y
RUN apt install mariadb-client -y

# Wordpress installation
RUN wget https://fr.wordpress.org/wordpress-6.5-fr_FR.tar.gz -P /var/www
RUN tar -xzf /var/www/wordpress-6.5-fr_FR.tar.gz -C /var/www
RUN rm /var/www/wordpress-6.5-fr_FR.tar.gz
RUN chown -R root:root /var/www/wordpress

# Modify php configuratin file
COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d

# Install WP-CLI
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY ./tools/auto-config.sh /bin/
# RUN sh /bin/auto-config.sh
