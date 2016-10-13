class upeweb::venv {
  file { 'venv_setup':
    ensure => 'file',
    source => 'puppet:///modules/upeweb/venv_setup.sh',
    path => '/var/upeweb/venv_setup.sh',
    mode => '0744',
    owner => 'vagrant',
    group => 'vagrant',
  }

  file { 'venv_install':
    ensure => 'file',
    source => 'puppet:///modules/upeweb/venv_install.sh',
    path => '/var/upeweb/venv_install.sh',
    mode => '0744',
    owner => 'vagrant',
    group => 'vagrant',
  }

  exec { 'install_venv':
    require => File['venv_setup'],
    command => '/var/upeweb/venv_install.sh',
    creates => '/var/upeweb/.venvsetupdone',
    notify => Exec['setup_venv'],
  }

  exec { 'setup_venv':
    refreshonly => true,
    require => File['venv_install'],
    command => '/var/upeweb/venv_setup.sh',
    user => 'vagrant',
  }
}
