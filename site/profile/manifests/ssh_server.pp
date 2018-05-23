class profile::ssh_server {
  package { 'openssh-server':
    ensure => 'present',
  }
  
  service { 'ssh':
    ensure => 'running',
    enable => 'true',
  }
}
