#Ubuntu Setup#

## Root tasks ##

### Update Server ###
1. apt-get update
1. apt-get upgrade

### install required apps ###
1. apt-get install nginx
1. apt-get update
1. apt-get install git
1. vi /etc/apt/sources.list.d/pgdg.list
    * `deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main`
1. wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
1. apt-get update
1. apt-get install postgresql-9.4
1. wget latest go
1. tar -C /usr/local -xzf go.tar.gz

### setup firewall ###
1. ufw allow 22
1. ufw allow 80
1. ufw --force enable

### Lock down ssh ###
1. vim /etc/ssh/sshd_config
    * `PermitRootLogin no`
	* `PasswordAuthentication no`
1. service ssh restart

### Setup cron jobs ###
1. sudo cp setup/crontab /etc/crontab

### Create user ###
1. adduser mca
1. adduser mca sudo

### Add user to databse ###
1. su postgres
1. createuser mca

---

## As mca ##

### For login ###
1. mkdir ~/.ssh
1. vi ~/.ssh/authorized_keys
1. (setup public key)

### Get Repo ###
1. git clone https://mpeppler@bitbucket.org/mpeppler/wanderinglunch.git

### Setup site ###
1.  Add environmental variables to .zshrc
1.  cd wanderinglunch
1.  sudo rm /etc/nginx/sites-enabled/default
1.  sudo cp setup/wanderinglunch /etc/nginx/sites-available/
1.  sudo ln -s /etc/nginx/sites-available/wanderinglunch /etc/nginx/sites-enabled/wanderinglunch
1.  sudo nginx -s reload
1.  sudo vi /etc/postgresql/9.4/main/pg_hba.conf
	* `host all all 127.0.0.1/32 trust`

1.  sudo service postgresql restart
1.  psql "foodtruck" < /home/mca/wanderinglunch/backup.sql

### Start site ###
1. tmux new -s site
1. cd /home/mca/wanderinglunch
1. make run

### Keep server updated ###
1. sudo apt-get install unattended-upgrades
1. vim /etc/apt/apt.conf.d/10periodic

#### Data ####
    APT::Periodic::Update-Package-Lists "1";
    APT::Periodic::Download-Upgradeable-Packages "1";
    APT::Periodic::AutocleanInterval "7";
    APT::Periodic::Unattended-Upgrade "1";
