class minecraft (
$url = 'https://launcher.mojang.com/mc/game/1.12.2/server/886945bfb2b978778c3a0288fd7fab09d315b25f/server.jar',
$install_dir = '/opt/minecraft',){
  
  file { "/opt/minecraft":
    ensure => directory,
  }
  
  file { "$install_dir/eula.txt":
    ensure  => file,
    content => "eula=true",
  }
  
  package { 'default-jre':
    ensure => installed,
  }
  
  wget::fetch { "download server.jar":
    source      => "$url",
    destination => "$install_dir",
    timeout     => 0,
    verbose     => false,
    before      => Service['minecraft'],
  }
  
  file { "$install_dir/server.jar":
    ensure => file,
  }
  
  file { '/etc/systemd/system/minecraft.service':
    ensure => file,
    content => epp('minecraft/minecraft.service.epp', {
      install_dir => $install_dir
    }),
  }
  
  service { 'minecraft':
    ensure  => running,
    enable  => true,
    require => [
      Package['default-jre'],
      File["$install_dir/eula.txt"],
      File['/etc/systemd/system/minecraft.service'],
      File["$install_dir/server.jar"],
      ]
  }
}
