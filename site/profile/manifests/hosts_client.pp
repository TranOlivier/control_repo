class profile::hosts_client {
  host { 'client1':
    ensure       => present,
    host_aliases => ['client-test2','client-dev2'],
    ip           => '10.94.69.28',
  }
}
