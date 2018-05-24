class minecraft {

  file { '/opt/minecraft':
    ensure => directory,
  }
  
  file { '/opt/minecraft/eula.txt':
    ensure => file,
    content => "eula=true",
  }
  
  package { 'default-jre':
    ensure => installed,
  }
  
  file { '/opt/minecraft/server.jar':
    ensure => file,
    source => 'puppet:///modules/minecraft/server.jar',
  }
  
  file { '/etc/systemd/system/minecraft.service':
    ensure => file,
    content => "[Unit]\n Description=server minecraft\n Wants=network.target\n After=network.target\n[Service]\n WorkingDirectory=/opt/minecraft/\n ExecStart=/usr/bin/java -Xmx512M -Xms32M -jar server.jar nogui\n[Install]\n WantedBy=multi-user.target",
  }
  
  service { 'minecraft.service':
    ensure => running,
    enable => true,
  }
}
