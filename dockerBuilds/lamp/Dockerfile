# Dockerfile to build a  LAMP Docker Container

FROM ubuntu
MAINTAINER Paolo Arcagni - paolo.arcagni@gmail.com

RUN apt update
RUN apt upgrade -y
RUN echo "mysql-server mysql-server/root_password password default" | debconf-set-selections
RUN echo "mysql-server mysql-server/root_password_again password default" | debconf-set-selections
RUN apt install -y apache2 apache2-utils
RUN apt install -y mysql-client mysql-server
RUN apt install -y php7.0 php7.0-mysql libapache2-mod-php7.0 php7.0-cli php7.0-cgi php7.0-gd
RUN apt install -y vim curl

#WORKDIR /var/www/html
#RUN echo "<?php phpinfo(); ?>" > info.php

COPY startContainer.sh /usr/local/bin/.
RUN chmod 755 /usr/local/bin/startContainer.sh

EXPOSE 80

CMD /usr/local/bin/startContainer.sh
