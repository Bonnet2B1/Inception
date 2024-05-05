# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    mariadb-setup.sh                                   :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: edelarbr <edelarbr@student.42mulhouse.fr>  +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/05/05 15:41:28 by edelarbr          #+#    #+#              #
#    Updated: 2024/05/06 00:31:07 by edelarbr         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

DB_NAME=thedatabase
DB_USER=theuser
DB_PASSWORD=abc
MARIADB_PASS_ROOT=123

service mariadb start

mariadb -v -u root << EOF
CREATE DATABASE IF NOT EXISTS $DB_NAME;
CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';
GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';
GRANT ALL PRIVILEGES ON $DB_NAME.* TO 'root'@'%' IDENTIFIED BY '$MARIADB_PASS_ROOT';
SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$MARIADB_PASS_ROOT');
EOF

sleep 5

service mariadb stop
