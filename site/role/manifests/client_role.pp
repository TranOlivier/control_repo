class role::client_role {
  include profile::ssh_server,
  include profile::hosts_client
}
