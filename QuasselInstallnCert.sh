#!/bin/bash
# Scripted process quasselcore installation and certificate issuance
# Run script as root or sudo to ensure proper function
# 2020-05-12

## List below are various distros package managers with installs for needed applications
## Uncomment the line applicable to your package manager

# yum install -y quassel-core certbot
# apt install -y quassel-core certbot
# pacman -S --noconfirm quassel-core certbot

echo Please enter domain name:
read domainname

#validating domain entry
echo $domainname
read -p "Is this domain correct? " -n 1 -r
echo    # (optional) move to a new line
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    exit 1
fi

##certbot will automatically create cronjob for renewal
certbot certonly --standalone -d $domainname
mv /var/lib/quassel/quasselCert.pem /var/lib/quassel/quasselCert.pem.old
cat /etc/letsencrypt/live/$domainname/{fullchain,privkey}.pem >> /var/lib/quassel/quasselCert.pem

systemctl restart quasselcore

echo You can now connect to your IRC bouncer with SSL. Default port is 4242
