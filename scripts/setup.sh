#!/bin/bash -eu


/usr/sbin/slapd -h "ldap:/// ldapi:///" -g openldap -u openldap -F /etc/ldap/slapd.d

pushd ./conf

# Configure palm7.net
sed -e "s@\[OLC_ROOT_PW\]@$(slappasswd -s password)@" init.ldif.tmpl > init.ldif
ldapmodify -Y EXTERNAL -H ldapi:/// -f init.ldif


### Setup User data.

# Organization
ldapadd -x -D "cn=Manager,dc=palm7,dc=net" -f organization.ldif -w 'password'
ldapadd -x -D "cn=Manager,dc=palm7,dc=net" -f organizationUnit.ldif -w 'password'


# Admin user.
sed -e "s@\[password\]@$(slappasswd -s admin123)@" Admin.ldif.tmpl > Admin.ldif
ldapadd -x -D "cn=Manager,dc=palm7,dc=net" -f Admin.ldif -w 'password'
sudo ldapmodify -Q -Y EXTERNAL -H ldapi:/// -f Admin_access.ldif


# develop user.
sed -e "s@\[password\]@$(slappasswd -s tamutamu)@" users.ldif.tmpl > users.ldif
ldapadd -x -D "cn=Manager,dc=palm7,dc=net" -f users.ldif -w 'password'


popd
