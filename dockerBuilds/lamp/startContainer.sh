#!/bin/bash
mkdir -p /var/lib/mysql /var/run/mysqld
chown -R mysql:mysql /var/lib/mysql /var/run/mysqld
service mysql start
a2enmod rewrite
service apache2 start
tail -f /var/log/apache2/access.log
