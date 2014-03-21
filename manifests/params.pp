class syslogng::params {

  case $::operatingsystem {
    /^(Debian|Ubuntu)$/: {
      $syslogng_package     = 'syslog-ng-core'
      $syslogng_service     = 'syslog-ng'
      $syslogng_config      = '/etc/syslog-ng'
      $syslogng_config_file = 'syslog-ng.conf'
      $syslogng_config_dir  = 'conf.d'
      $root_log_dir         = hiera('root_log_dir')
    }
    default: {
      fail ("${::operatingsystem} not supported.")
    }
  }
}
