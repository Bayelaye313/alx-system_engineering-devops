# Ensure Python and pip are installed
class { 'python':
  version => '3',
}

# Install Flask version 2.1.0 using pip3
python::pip { 'flask':
  ensure       => '2.1.0',
  pip_provider => 'pip3',
}
