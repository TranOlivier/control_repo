class profile::base {
  user { 'admin':
    ensure  => 'present',
    groups => 'sudo',
    password => 'password',
  }
  
  file { '/root/MOTD':
    ensure => file,
    content => "Knowledge is power, protect it\n",
  }
  
}

