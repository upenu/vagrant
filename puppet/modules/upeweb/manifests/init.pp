class upeweb {
  # Define class variables
  $cmd_user = 'vagrant'
  $cmd_group = 'vagrant'
  $homedir = '/home/vagrant'
  $webdir = "${homedir}/upedev/website" # Double quotes for interpolation

  # Include all classes
  include upeweb::setup
  include upeweb::venv
  include upeweb::database
  include upeweb::packages

  # Define class dependencies
  Class['upeweb::packages'] -> Class['upeweb::setup'] -> Class['upeweb::database'] -> Class['upeweb::venv']
}
