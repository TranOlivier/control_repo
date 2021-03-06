node default {
  user { 'bibi':
    ensure => present,
  }
}


node 'puppet' {
  include role::master_server
}

node /^client/ {
  include role::client_role
}

node /^web/ {
  include role::app_server
}


node /^minecraft/ {
  include role::minecraft_server
}
