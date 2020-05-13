# IRC-Related
Scripts/Deployments relating to IRC/Bouncers

---QuasselInstallnCerts.sh---
Straight-forward script; Installs quassel-core and certbot (Let'sEncrypt) with default values, takes input for domain name, and builds certificate for quassel usage.
Allows for fairly simple setup of bouncer.
Configure DNS (A record) pointing to VPS/server/toaster prior to running.
Need to be able to pass certbot challenges, criteria listed here: https://certbot.eff.org/docs/challenges.html?highlight=http 
NOTE: Should be run as root/sudo'd
