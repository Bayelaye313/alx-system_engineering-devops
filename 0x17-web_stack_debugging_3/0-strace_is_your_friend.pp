# 0-strace_is_your_friend.pp
exec { 'create-apache-directory':
  command => '/bin/mkdir -p /var/www/html',
  onlyif  => '/bin/test ! -d /var/www/html',
}

file { '/var/www/html':
  ensure => directory,
  owner  => 'www-data',
  group  => 'www-data',
  mode   => '0755',
}

service { 'apache2':
  ensure => running,
  enable => true,
  require => Exec['create-apache-directory'],
}
