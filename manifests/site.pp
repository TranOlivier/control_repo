node default {
  user { 'admin':
    ensure => present,
  }
  
  file { '/root/README':
    ensure => present,
    content => "Ceci est un readme\n Mon adresse IP est ${ipadress}\n OS: ${os.name}\n",
  }
}
