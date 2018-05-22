node default {
  user { 'admin':
    ensure => present,
  }
  
  file { '/root/README':
    ensure => present,
    content => "Ceci est un readme\nMon adresse IP est ${ipadress}\nOS: ${os.name}\n",
  }
}
