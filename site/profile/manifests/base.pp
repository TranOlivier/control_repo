class profile::base {
  user { 'admin':
    ensure  => 'present',
    groups => wheel,
  }
  
  file { '/root/README':
    ensure => file,
    content => "Bienvenue sur ${fqdn}\n",
  }
  
  file { '/root/MOTD':
    ensure => file,
    content => "Knowledge is power, protect it\n",
  }
  
}

