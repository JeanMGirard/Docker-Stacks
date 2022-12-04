#!/bin/sh

# -----------------------
#CentOS 7
# yum update -y
# yum install openldap openldap-servers

#Ubuntu 16.04/18.04
apt update -y && apt upgrade -y
apt install -y slapd ldap-utils ufw nano # ask root password


useradd ldap-server
groupadd ldap
usermod -a 'ldap-server' -G ldap
usermod -a 'ldap-server' -G sudo
# -----------------------
#CentOS 7
# systemctl start slapd
# systemctl enable slapd
# systemctl status slapd
# firewall-cmd --add-service=ldap

# Ubuntu 16.04/18.04
service slapd start
ufw allow ldap && ufw enable
service --status-all
# -----------------------
# echo "dn: olcDatabase={0}config,cn=config" > rootpasswd.ldif 
# echo "changetype: modify" >> rootpasswd.ldif
# echo "add: olcRootPW" >> rootpasswd.ldif
# echo "olcRootPW: $(slappasswd -s $LDAP_ADMIN_PASSWORD)" >> rootpasswd.ldif
# -----------------------
ldapadd -Y EXTERNAL -H ldapi:/// -f rootpasswd.ldif  
#cp /usr/share/openldap-servers/DB_CONFIG.example /var/lib/ldap/DB_CONFIG
cp /usr/share/slapd/DB_CONFIG /var/lib/ldap/DB_CONFIG
chown -R ldap-server:ldap /var/lib/ldap/DB_CONFIG #chown -R root:sudo /var/lib/ldap/DB_CONFIG
# -----------------------
service slapd restart
# -----------------------

ldapadd -Y EXTERNAL -H ldapi:/// -f /etc/ldap/schema/cosine.ldif 
ldapadd -Y EXTERNAL -H ldapi:/// -f /etc/ldap/schema/nis.ldif
ldapadd -Y EXTERNAL -H ldapi:/// -f /etc/ldap/schema/inetorgperson.ldif

/usr/share/slapd