#!/bin/bash -eu
 
 
### Install openldap.
export DEBIAN_FRONTEND=noninteractive
debconf-set-selections <<< 'slapd slapd/password1 password password'
debconf-set-selections <<< 'slapd slapd/password2 password password'
debconf-set-selections <<< 'slapd slapd/internal/adminpw password password'
debconf-set-selections <<< 'slapd slapd/internal/generated_adminpw password password'


sudo apt -y install slapd ldap-utils
 
sudo systemctl enable slapd
#sudo systemctl start slapd

