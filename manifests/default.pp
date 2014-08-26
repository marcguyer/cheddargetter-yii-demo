Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }

class apache {

  package { "apache2":
    ensure  => present,
    require => Class["system-update"],
  }

  service { "apache2":
    ensure  => "running",
    require => Package["apache2"],
  }

  file { '/var/www/html':
     ensure => 'link',
     require => Package["apache2"],
     target => '/vagrant/web',
     force => true,
  }

}

class system-update {

  exec { 'apt-get update':
    command => 'apt-get update --yes',
    notify => Exec['apt-get autoremove']
  }

  exec { 'apt-get autoremove':
    command => 'apt-get autoremove --yes',
  }

  $sysPackages = [
    "build-essential",
    "php5",
    "libapache2-mod-php5",
	"php5-mcrypt"
  ]
  package { $sysPackages:
    ensure => "installed",
    require => Exec['apt-get update'],
  }
}

class { 'composer':
    suhosin_enabled => false, # avoids libaugeas dependency
}

composer::exec { 'cheddargetter-client-install':
  cmd                  => 'install',  # REQUIRED
  cwd                  => '/vagrant', # REQUIRED
  prefer_source        => false,
  prefer_dist          => false,
  dry_run              => false, # Just simulate actions
  custom_installers    => false, # No custom installers
  scripts              => false, # No script execution
  interaction          => false, # No interactive questions
  optimize             => false, # Optimize autoloader
  dev                  => true, # Install dev dependencies
}

include system-update
include apache
