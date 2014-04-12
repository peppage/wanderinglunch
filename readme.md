#Wandering Lunch#

##Ubuntu setup##
    
##Steps##
    
1. apt-get install git puppet
1. puppet module install puppetlabs-postgresql
1. git clone https://bitbucket.org/mpeppler/wanderinglunch.git /wanderinglunch
1. cd /wanderinglunch
1. puppet apply setup.pp
1. passwd mca
1. login mca
1. cd /wanderinglunch
1. forever start app.js
    
##Optional Server Setup##

###Lock down ssh###
1. vim /etc/ssh/sshd_config
    * ```PermitRootLogin no```
1. service ssh restart

###Automatic security updates###
1. apt-get install unattended-upgrades
1. vim /etc/apt/apt.conf.d/10periodic  
- `APT::Periodic::Update-Package-Lists "1";`<br \>
  `APT::Periodic::Download-Upgradeable-Packages "1";`<br>
  `APT::Periodic::AutocleanInterval "7";`<br>
  `APT::Periodic::Unattended-Upgrade "1";`