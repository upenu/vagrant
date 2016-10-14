class upeweb::venv {
  file { 'venv_setup':
    ensure => 'file',
    source => 'puppet:///modules/upeweb/venv_setup.sh',
    path => '/var/upeweb/venv_setup.sh',
    mode => '0744',
    owner => $upeweb::cmd_user,
    group => $upeweb::cmd_group,
  }

  file { 'venv_install':
    ensure => 'file',
    source => 'puppet:///modules/upeweb/venv_install.sh',
    path => '/var/upeweb/venv_install.sh',
    mode => '0744',
    owner => $upeweb::cmd_user,
    group => $upeweb::cmd_group,
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
    user => $upeweb::cmd_user,
  }
}
