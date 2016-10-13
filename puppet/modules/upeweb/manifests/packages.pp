class upeweb::packages {
  exec { 'apt-get update':
    command => 'apt-get update',
  }
  
  package {[
      'build-essential',
      'git',
      'libmysqlclient-dev',
      'mysql-client',
      'python3',
      'python3-dev',
      'python3-pip',
      'tmux',
      'vim',
    ]:
    ensure => installed,
    require => Exec['apt-get update'],
  }

  package { 'mysql-server':
    ensure  => installed,
    responsefile => '/var/cache/debconf/mysql.preseed',
    require => File['/var/cache/debconf/mysql.preseed'],
  }

  file { '/var/cache/debconf/mysql.preseed':
    source => 'puppet:///modules/upeweb/mysql.preseed',
    ensure => present,
  }
}
