## Simple Setup
- chage (change user password expiry information) -l (list)
- ufw (firewall) status(shows status of ports)
- uname (shows system) -a (shows all information)
- sudo systemctl status **program** (shows program status)
- sudo systemctl enable/disable **program** (enables or disables program)
---

## User
- id **username** (shows which groups are the ones user is in)
- groups (shows every group user is in)
- sudo adduser **username** (adds a new user)
- passwd **username** (changes the users password)
- /etc/login.defs (expiry informations)
- /etc/pam.d/common-password (libpam-pwquality)
- addgroup **groupname** (creates a new group)
- usermod -aG **groupname** **username** (assign a user into a group)
---
## Hostname
- hostname (shows hostname)
- sudo hostnamectl set-hostname **newname** (gives hostname a new name)
- /etc/hosts (the file contains hosts and ip addresses)
- lsblk (gives information about computer)
---
## Sudo
- sudo visudo (opens sudos config)
- /var/log/sudo (log of cods that run with sudo)
---
## UFW
- sudo ufw status (shows ports status)
- sudo ufw allow **port** (gives acces to port from firewall)
- sudo ufw delete **deleting line** (deletes the rule)
---
## SSH
- /etc/ssh/sshd_config (config)
- ssh **username**@**ip** -p **port** (connects to open ssh server)
---
## Cron
- sudo crontab -u (chose user) -l (list) -e (edit)