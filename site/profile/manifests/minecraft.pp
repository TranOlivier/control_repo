class profile::minecraft_server {
  file { '/opt/minecraft':
    ensure => present,
    ensure => directory,
  }
  
  file { '/opt/minecraft/eula.txt':
    ensure => present,
    content => "eula=true",
  }
  
  
    
}
