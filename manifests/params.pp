class appformix::params {
  case $::osfamily {
    'Debian': {
      $provider = 'dpkd'
      $extension = 'deb'
    }
    'RedHat': {
      $provider = 'dpkd'
      $extension = 'deb'
    }
    default: {
      fail("osfamily ${::osfamily} is not supported")
    }
  }
}
