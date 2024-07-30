# site.pp
class { 'nginx': }

nginx::resource::vhost { 'default':
  ensure       => present,
  listen_port  => 80,
  server_name  => '_',
  root         => '/var/www/html',
  index_files  => ['index.html'],
}

# Créer le fichier index.html avec "Hello World!"
file { '/var/www/html/index.html':
  ensure  => file,
  content => 'Hello World!',
  require => Class['nginx'],
}

# Ajouter une redirection 301 pour /redirect_me
file { '/etc/nginx/sites-available/default':
  ensure  => file,
  content => template('nginx/vhost/default.erb'),
  require => Class['nginx'],
}

# Activer le site par défaut
file { '/etc/nginx/sites-enabled/default':
  ensure => link,
  target => '/etc/nginx/sites-available/default',
  require => File['/etc/nginx/sites-available/default'],
}

# Redémarrer Nginx pour appliquer les changements
exec { 'restart_nginx':
  command     => '/usr/sbin/service nginx restart',
  refreshonly => true,
  subscribe   => File['/etc/nginx/sites-available/default'],
}
