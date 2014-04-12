exec { 'apt-get update':
  command => '/usr/bin/apt-get update',
}
~>
exec { 'apt-get upgrade':
  command => '/usr/bin/apt-get --yes --force-yes upgrade',
}

package { 'fail2ban':
  ensure => installed,
}

package { 'nginx':
  ensure => installed,
}
~>
file { '/etc/nginx/sites-enabled/default':
  ensure => absend,
}
~>
file { '/data':
  ensure => directory,
}
~>
file { '/data/nginx':
  ensure => directory,
}

class { 'apt' :
  always_apt_update => true,
}

apt::ppa { 'ppa:fish-shell/release-2': }
~>
package { 'fish':
  ensure => installed,
}

apt::ppa { 'ppa:chris-lea/node.js': }
~>
package { 'nodejs':
  ensure => installed,
}

exec { 'allow port 22': 
  path    => '/usr/sbin',
  command => 'ufw allow 22',
}
~>
exec { 'allow port 80':
  path    => '/usr/sbin',
  command => 'ufw allow 80',
}
exec { 'enable firewall':
  path    => '/usr/sbin',
  command => 'ufw --force enable',
}

exec { 'install forever':
  path    => '/usr/bin/',
  command => 'npm install -g forever',
  require => Package['nodejs'],
}

exec { 'npm install':
  cwd     => '/wanderinglunch',
  path    => '/usr/bin',
  command => 'npm install',
  require => Package['nodejs'],
}

file { 'wanderinglunch':
  path    => '/etc/nginx/sites-available/wanderinglunch',
  ensure  => file,
  require => Package['nginx'],
  source  => '/wanderinglunch/config/wanderinglunch'
}
~>
exec { 'reload nginx':
  path => '/usr/sbin',
  command => 'nginx -s reload',
}
~>
file { '/etc/nginx/sites-enabled/wanderinglunch':
  ensure => link,
  target => '/etc/nginx/sites-available/wanderinglunch'
}

class { 'postgresql::globals':
  manage_package_repo => true,
  version             => '9.3',
  require             => User['mca'],
}
~>
class { 'postgresql::server': 
 ipv4acls => ['host all all 127.0.0.1/32 trust'],
}
~>
postgresql::server::db { 'foodtruck':
  user     => 'mca',
  password => postgresql_password('mca', ''),
}
~>
postgresql::server::role { 'root':
  password_hash => postgresql_password('root', 'mypasswd'),
}
~>
postgresql::server::database_grant { 'root access foodtruck':
  privilege => 'ALL',
  db        => 'foodtruck',
  role      => 'root',
}
~>
exec { 'restore database' :
  command => 'psql "foodtruck" < /wanderinglunch/foodtruck-backup.sql',
  path    => '/usr/bin/',
}
~>
postgresql::server::table_grant { 'mca on trucks':
  privilege => 'ALL',
  table     => 'trucks',
  db        => 'foodtruck',
  role      => 'mca',
}
~>
postgresql::server::table_grant { 'mca on images':
  privilege => 'ALL',
  table     => 'images',
  db        => 'foodtruck',
  role      => 'mca',
}
~>
postgresql::server::table_grant { 'mca on tweets':
  privilege => 'ALL',
  table     => 'tweets',
  db        => 'foodtruck',
  role      => 'mca',
}
~>
postgresql::server::table_grant { 'mca on sitestats':
  privilege => 'ALL',
  table     => 'stats',
  db        => 'foodtruck',
  role      => 'mca',
}
~>
postgresql::server::table_grant { 'mca on truckstats':
  privilege => 'ALL',
  table     => 'stats',
  db        => 'foodtruck',
  role      => 'mca',
}

cron { 'getTrucks weekly' :
  command  => 'cd /wanderinglunch/scripts && python getTruckInfo.py',
  user     => 'mca',
  minute   => '*/15',
  hour     => '11-22',
  monthday => '*',
  month    => '*',
  weekday  => '1-5',
  require  => User['mca']
}

cron { 'getTrucks weekly off hours' :
  command  => 'cd /wanderinglunch/scripts && python getTruckInfo.py',
  user     => 'mca',
  minute   => '*/30',
  hour     => '23-9',
  monthday => '*',
  month    => '*',
  weekday  => '1-5',
  require  => User['mca']
}

cron { 'getTrucks weekends' :
  command  => 'cd /wanderinglunch/scripts && python getTruckInfo.py',
  user     => 'mca',
  minute   => '*/45',
  hour     => '10-22',
  monthday => '*',
  month    => '*',
  weekday  => '6-7',
  require  => User['mca']
}

cron { 'validate photos' :
  command  => 'cd /wanderinglunch/scripts && python validatePhotos.py',
  user     => 'mca',
  minute   => '00',
  hour     => '6',
  monthday => '*',
  month    => '*',
  weekday  => '*',
  require  => User['mca']
}

cron { 'truncate tweets' :
  command  => 'psql "foodtruck" -c \'truncate tweets;\'',
  user     => 'mca',
  minute   => '00',
  hour     => '6',
  monthday => '*',
  month    => '*',
  weekday  => '6',
  require  => User['mca']
}

cron { 'get stats' :
  command  => 'pepp cd /wanderinglunch/scripts && python stats.py',
  user     => 'mca',
  minute   => '00',
  hour     => '17',
  monthday => '*',
  month    => '*',
  weekday  => '1-5',
  require  => User['mca']
}

user { 'mca' :
  ensure     => 'present',
  managehome => 'true',
  shell      => '/usr/bin/fish',
  groups     => 'sudo',
  require    => Package['fish']
}

exec { 'site permissions':
  cwd     => '/wanderinglunch',
  path    => '/bin',
  command => 'chown -R mca .',
  require => User['mca'],
}

package { 'python':
  ensure => installed,
}

package { 'libpq-dev':
  ensure => installed,
}

package { 'python-pip':
  ensure => installed,
}

package { 'python-dev':
  ensure => installed,
}

exec { 'python requirements':
  path    => '/usr/bin',
  command => 'pip install psycopg2 nltk numpy twitter foursquare',
  require => Package['python-pip'],
}
~>
exec { 'setup nltk':
  path    => '/usr/bin',
  user    => 'mca',
  environment => ['HOME=/home/mca'],
  command => "python -c \"import nltk; nltk.download('all')\"",
}
