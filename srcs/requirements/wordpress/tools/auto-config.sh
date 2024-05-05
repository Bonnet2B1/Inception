# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    auto-config.sh                                     :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: edelarbr <edelarbr@student.42mulhouse.fr>  +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/05/05 20:31:45 by edelarbr          #+#    #+#              #
#    Updated: 2024/05/05 22:52:19 by edelarbr         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# - patch
wp config create --allow-root --dbname=$DB_DATABASE --dbuser=$DB_USER --dbpass=$DB_PASSWORD --dbhost=mariadb:3306 --path='/var/www/wordpress'
