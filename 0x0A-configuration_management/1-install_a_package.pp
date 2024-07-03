# Ensure that Python 3 and pip3 are installed
package { 'python3':
  ensure => installed,
}

package { 'python3-pip':
  ensure => installed,
}

# Install Flask version 2.1.0 using pip3
exec { 'install_flask':
  command => '/usr/bin/pip3 install flask==2.1.0',
  unless  => '/usr/bin/pip3 show flask | grep -q "Version: 2.1.0"',
  require => Package['python3-pip'],
}