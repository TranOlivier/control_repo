class profile::hosts {
  host { 'client1':
    ensure       => present,
    host_aliases => ['client-test2','client-dev2'],
    ip           => '10.94.69.28',
  }
  
  host { 'client2':
    ensure       => present,
    host_aliases => ['client-test3','client-dev3'],
    ip           => '10.94.69.37',
  }
}
