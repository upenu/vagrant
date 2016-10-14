class upeweb::setup {
  vcsrepo { $upeweb::webdir :
    ensure   => present,
    provider => git,
    source   => 'https://github.com/upenu/website.git',
    user => $upeweb::cmd_user,
    group => $upeweb::cmd_group,
  }

  file { '/var/upeweb':
    ensure => 'directory',
    mode => 0755,
  }
}
