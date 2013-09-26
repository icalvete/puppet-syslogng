class syslogng::install{

  package { $syslogng::params::syslogng_package:
    ensure => present
  }
}
