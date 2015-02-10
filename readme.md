#Ubuntu Setup#

## Root tasks ##

### Update Server ###
1. apt-get update
1. apt-get upgrade

### install required apps ###
1. apt-get install fail2ban nginx
1. apt-add-repository ppa:fish-shell/release-2
1. apt-get update
1. apt-get install fish
1. curl -sL https://deb.nodesource.com/setup | sudo bash -
1. apt-get install nodejs
1. apt-get install build-essential
1. apt-get install git
1. vi /etc/apt/sources.list.d/pgdg.list
    * `deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main`
1. wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
1. apt-get update
1. apt-get install postgresql-9.4
1. apt-get install python python-pip python-dev libpq-dev
1. pip install psycopg2 twitter foursquare

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
1. vi /etc/crontab

#### data #####
	*/15 11-22 * * 1-5 mca cd /wanderinglunch/scripts && python getTruckInfo.py
    */30 23,0-9 * * 1-5 mca cd /wanderinglunch/scripts && python getTruckInfo.py
    00 10 * * 1-5 mca cd /wanderinglunch/scripts && python getTruckInfo.py
    */45 10-22 * * 6-7 mca cd /wanderinglunch/scripts && python getTruckInfo.py
    00 6 * * * mca cd /wanderinglunch/scripts && python validatePhotos.py
    00 6 * * 6 mca psql "foodtruck" -c 'truncate tweets;'
    0 17 * * 1-5 mca cd /wanderinglunch/scripts && python stats.py

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
1. sudo git clone https://mpeppler@bitbucket.org/mpeppler/wanderinglunch.git /wanderinglunch
1. sudo chown mca -R /wanderinglunch

### Configure shell ###
1. mkdir -p .config/fish
1. vi .config/fish/config.fish
1. chsh -s /usr/bin/fish

#### Data ####
    function fish_user_key_bindings
      bind \e\[1~ beginning-of-line
      bind \e\[3~ delete-char
      bind \e\[4~ end-of-line
    end

    setenv EDITOR vim
    
    function delcache
      sudo find /data/nginx/ -type f -delete
    end


### Setup site ###
1. cd /wanderinglunch
1.  npm install
1.  sudo mkdir -p /data/nginx
1.  sudo rm /etc/nginx/sites-enabled/default
1.  sudo cp setup/wanderinglunch /etc/nginx/sites-available/
1.  sudo ln -s /etc/nginx/sites-available/wanderinglunch /etc/nginx/sites-enabled/wanderinglunch
1.  sudo service nginx stop
1.  sudo service nginx start
1.  sudo vi /etc/postgresql/9.4/main/pg_hba.conf
	* `host all all 127.0.0.1/32 trust`

1. sudo service postgresql restart
1.  psql "foodtruck" < /wanderinglunch/foodtruck-backup.sql

### Keep the site up ###
1.  npm install pm2 -g
1.  pm2 start --name wanderinglunch app.js

### Keep server updated ###
1. sudo apt-get install unattended-upgrades
1. vim /etc/apt/apt.conf.d/10periodic

#### Data ####
    APT::Periodic::Update-Package-Lists "1";
    APT::Periodic::Download-Upgradeable-Packages "1";
    APT::Periodic::AutocleanInterval "7";
    APT::Periodic::Unattended-Upgrade "1";

(setup munin)?