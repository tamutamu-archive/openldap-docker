#!/bin/bash

#apt -y install apache2 php php-cgi libapache2-mod-php php-mbstring php-common php-pear
apt -y install apache2

a2enconf php7.2-cgi
systemctl reload apache2

apt -y install phpldapadmin

systemctl restart apache2
