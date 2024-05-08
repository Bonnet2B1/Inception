# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: edelarbr <edelarbr@student.42mulhouse.fr>  +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/05/04 17:54:05 by edelarbr          #+#    #+#              #
#    Updated: 2024/05/08 19:17:36 by edelarbr         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:bullseye

EXPOSE 443

RUN apt update -y
RUN apt upgrade -y

RUN apt install nginx -y
RUN apt install openssl -y

# SSL certificate
RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=Haut-Rhin/L=Mulhouse/O=42/OU=42/CN=edelarbr.42.fr/UID=edelarbr"

# Nginx configuration
RUN mkdir -p /var/run/nginx
COPY ./conf/nginx.conf /etc/nginx/nginx.conf

# Nginx index
RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html
RUN touch /tmp/started
CMD [ "nginx", "-g", "daemon off;" ]
