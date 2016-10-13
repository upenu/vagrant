class upeweb::setup {
  vcsrepo { '/home/vagrant/website':
    ensure   => present,
    provider => git,
    source   => 'https://github.com/upenu/website.git',
    user => 'vagrant',
    group => 'vagrant',
  }

  file { '/var/upeweb':
    ensure => 'directory',
    mode => 0755,
  }
}
