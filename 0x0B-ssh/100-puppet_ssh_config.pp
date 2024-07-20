# Définir la ressource pour désactiver l'authentification par mot de passe
file_line { 'Turn off passwd auth':
  path  => '2-ssh_config',
  line  => 'PasswordAuthentication no',
  match => '^PasswordAuthentication',
}

# Définir la ressource pour spécifier le fichier de clé privée
file_line { 'Declare identity file':
  path  => '2-ssh_config',
  line  => 'IdentityFile ~/.ssh/school',
  match => '^IdentityFile',
}

