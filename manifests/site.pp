node default {
  user { 'admin':
    ensure => present,
  }
  
  file { '/root/README':
    ensure => present,
    content => "Ceci est un readme",
  }
}
