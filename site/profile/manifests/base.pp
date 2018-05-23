class profile::base {
  user { 'admin':
    ensure  => 'present',
    groups => 'sudo',
    password => 'password',
  }
  
  file { '/root/README':
    ensure => present,
    content => "Ceci est un lisez moi",
  }
  
  
  file { '/root/MOTD':
    ensure => file,
    content => "Knowledge is power, protect it\n",
  }
 
}

