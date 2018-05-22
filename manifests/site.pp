node default {
  user { 'bibi':
    ensure => present,
  }
}


node 'puppet' {
  include role::master_server
}
