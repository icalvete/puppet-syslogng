class syslogng (

  $logstash_protocol = $syslogng::params::logstash_protocol

) inherits syslogng::params {

  anchor{'syslogng::begin':
    before  => Class['syslogng::install']
  }

  class{'syslogng::install':
    require => Anchor['syslogng::begin']
  }

  class{'syslogng::config':
    require => Class['syslogng::install'],
  }

  class{'syslogng::service':
    subscribe => Class['syslogng::config']
  }

  anchor{'syslogng::end':
    require => Class['syslogng::service']
  }
}
