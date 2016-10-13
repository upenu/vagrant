class upeweb::database {
  file { 'database_setup':
    ensure => 'file',
    source => 'puppet:///modules/upeweb/mysql_setup.sh',
    path => '/var/upeweb/mysql_setup.sh',
    mode => '0700',
    owner => 'root',
    group => 'root',
    require => File['/var/upeweb'],
  }

  exec { 'database_setup':
    require => [File['database_setup'], Package['mysql-server']],
    command => '/var/upeweb/mysql_setup.sh',
    creates => '/var/upeweb/.dbsetupdone',
  }
}
