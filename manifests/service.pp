class syslogng::service {

  service { $syslogng::params::syslogng_service:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
