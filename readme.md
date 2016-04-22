#Ubuntu Setup#

## Root tasks ##

### Update Server ###
1. yum update

### install required apps ###
1. yum install epel-release nginx htop tmux git zsh
1. Follow to install https://wiki.postgresql.org/wiki/YUM_Installation
1. Add path to psql bin to path
1. wget latest go
1. tar -C /usr/local -xzf go.tar.gz
1. systemctl start nginx
1. systemctl enable nginx

### setup firewall ###
1. firewall-cmd --zone=public --permanent --add-service=http
1. firewall-cmd --zone=public --permanent --add-service=https
1. systemctl start firewalld.service
1. systemctl enable firewalld

### Lock down ssh ###
1. vim /etc/ssh/sshd_config
    * `PermitRootLogin no`
	* `PasswordAuthentication no`

### Create user ###
1. adduser mca
1. passwd mca
1. chsh -s /usr/bin/zsh mca
1. visudo
1. `mca     ALL=(ALL:ALL)   ALL`

### Add user to databse ###
1. su postgres
1. createuser mca

---

## As mca ##

### For login ###
1. get oh-my-zsh
1. mkdir ~/.ssh
1. vi ~/.ssh/authorized_keys
1. Create public key using puttygen
1. Put public part into authorized_keys
1. chmod 0700 ~/.ssh/
1. chmod 0644 .ssh/authorized_keys
1. TEST
1. sudo systemctl restart sshd
1. `ZSH_THEME="afowler"`
1. `export GOROOT=/usr/local/go`
1. `export GOPATH=$HOME/go`
1. `export PATH=$GOPATH/bin:$GOROOT/bin:$PATH`

### Get Repo ###
1. cd $GOPATH/src/
1. git clone https://mpeppler@bitbucket.org/mpeppler/wanderinglunch.git

### Setup site ###
1.  Install glide & gorazor
1.  Add environmental variables to .zshrc (TWIT_CON_KEY, TWIT_CON_SEC, TWIT_ACCESS_TOKEN, TWIT_ACCESS_SECRET, CLIENT_ID, CLIENT_SECRET, WL_SECRET, LOGGLY)
1.  cd $GOPATH/src/wanderinglunch
1.  sudo cp setup/wanderinglunch /etc/nginx/conf.d
1.  sudo nginx -s reload
1.  https://www.digitalocean.com/community/tutorials/how-to-install-and-use-postgresql-on-centos-7
1.  sudo vi /etc/postgresql/9.4/main/pg_hba.conf
	* `host all all 127.0.0.1/32 trust`

1.  sudo systemctl enable postgresql-9.5.service
1.  sudo systemctl start postgresql-9.5.service
1.  psql "foodtruck" < /home/mca/wanderinglunch/backup.sql

### Start site ###
1. tmux new -s site
1. cd $GOPATH/src/wanderinglunch
1. glide install
1. make run

### Keep server updated ###
1. sudo yum install yum-cron
1. sudo vi /etc/yum/yum-cron.conf
1. systemctl start yum-cron.service
1. systemctl enable yum-cron.service