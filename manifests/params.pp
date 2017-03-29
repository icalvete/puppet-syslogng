class syslogng::params {

  $root_log_dir  = hiera('root_log_dir', '/var/log')
  $remote_server = hiera('syslog_remote_server')
  $remote_port   = hiera('syslog_remote_port')

  case $::operatingsystem {
    /^(Debian|Ubuntu)$/: {
      $syslogng_package     = 'syslog-ng-core'
      $syslogng_service     = 'syslog-ng'
      $syslogng_config      = '/etc/syslog-ng'
      $syslogng_config_file = 'syslog-ng.conf'
      $syslogng_config_dir  = 'conf.d'
    }
    default: {
      fail ("${::operatingsystem} not supported.")
    }
  }
}
