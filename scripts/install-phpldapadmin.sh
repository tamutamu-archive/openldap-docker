#!/bin/bash

apt -y install apache2 php php-ldap php-cgi libapache2-mod-php php-mbstring php-common php-pear

a2enconf php7.2-cgi
systemctl reload apache2

pushd /tmp
wget --no-check-certificate https://github.com/leenooks/phpLDAPadmin/archive/1.2.5.tar.gz
tar xf 1.2.5.tar.gz
cp -r phpLDAPadmin-1.2.5 /var/www/html/phpldapadmin
chown www-data /var/www/html/ -R
cp /var/www/html/phpldapadmin/config/config.php{.example,}
popd

systemctl restart apache2
