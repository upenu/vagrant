class upeweb {
  # Include all classes
  include upeweb::setup
  include upeweb::venv
  include upeweb::database
  include upeweb::packages

  # Define class dependencies
  Class['upeweb::packages'] -> Class['upeweb::setup'] -> Class['upeweb::database'] -> Class['upeweb::venv']
}
