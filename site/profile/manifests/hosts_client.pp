class profile::hosts_client {
  host { 'puppet':
    ensure       => present,
    host_aliases => ['puppet-server','puppet-dev'],
    ip           => '10.94.69.27',
  }
}
