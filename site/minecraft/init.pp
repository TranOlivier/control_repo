class minecraft {

  file { '/opt/minecraft':
    ensure => present,
    ensure => directory,
  }
  
  file { '/opt/minecraft/eula.txt':
    ensure => present,
    content => "eula=true",
  }
  
  package { 'default-jre':
    ensure => installed,
  }
  
  file { '/opt/minecraft/server.jar':
    ensure => present,
    source => 'http://launcher.mojang.com/mc/game/1.12.2/server/886945bfb2b978778c3a0288fd7fab09d315b25f/server.jar',
  }
  
  file { '/etc/systemd/system/minecraft.service':
    ensure => present,
    content => "[Unit]\n Description=server minecraft\n Wants=network.target\n After=network.target\n[Service]\n WorkingDirectory=/opt/minecraft/\n ExecStart=/usr/bin/java -Xmx512M -Xms32M -jar server.jar nogui\n[Install]\n WantedBy=multi-user.target",
  }
  
  service { 'minecraft.service':
    ensure => running,
    enable => true,
  }
}
