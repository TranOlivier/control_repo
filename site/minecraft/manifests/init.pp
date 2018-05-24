class minecraft {
  include wget
  
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
  
  wget::fetch { "download server.jar":
    source      => 'https://launcher.mojang.com/mc/game/1.12.2/server/886945bfb2b978778c3a0288fd7fab09d315b25f/server.jar',
    destination => '/opt/minecraft/',
    timeout     => 0,
    verbose     => false,
  }
  
  file { '/etc/systemd/system/minecraft.service':
    ensure => file,
    source => 'puppet:///modules/minecraft/minecraft.service',
    content => "[Unit]\n Description=server minecraft\n Wants=network.target\n After=network.target\n[Service]\n WorkingDirectory=/opt/minecraft/\n ExecStart=/usr/bin/java -Xmx512M -Xms32M -jar server.jar nogui\n[Install]\n WantedBy=multi-user.target",
  }
  
  service { 'minecraft.service':
    ensure => running,
    enable => true,
  }
}
