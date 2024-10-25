#!/bin/bash

apt-get update
apt-get install -y apache2 php libapache2-mod-php php-mysql

mkdir -p /var/www/html/adminer
wget "https://www.adminer.org/latest.php" -O /var/www/html/adminer/index.php

a2enmod rewrite
systemctl restart apache2

ufw allow in "Apache Full"
