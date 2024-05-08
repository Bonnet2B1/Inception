# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: edelarbr <edelarbr@student.42mulhouse.fr>  +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/05/05 14:02:08 by edelarbr          #+#    #+#              #
#    Updated: 2024/05/07 22:29:59 by edelarbr         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:bullseye

EXPOSE 3306

RUN apt update -y
RUN apt upgrade -y

RUN apt install mariadb-server -y

# MariaDB configuration
RUN mkdir -p /run/mysqld/
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

# MariaDB setup
COPY ./tools/mariadb-setup.sh /bin/
RUN chmod +x /bin/mariadb-setup.sh

# MariaDB start
ENTRYPOINT [ "mariadb-setup.sh" ]
