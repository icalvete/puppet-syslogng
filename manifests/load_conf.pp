define syslogng::load_conf (

  $conf                   = undef,
  $log_dir                = undef,
  $log                    = undef,
  $syslog_remote_server   = undef,
  $syslog_remote_port     = 514,
  $logstash_remote_server = undef,
  $logstash_remote_port   = undef

) {

  include syslogng

  if $syslog_remote_server == undef {
    $remote_server = $syslogng::params::remote_server
  } else {
    $remote_server = $syslog_remote_server
  }

  if $syslog_remote_port == undef {
    $remote_port = $syslogng::params::remote_port
  } else {
    $remote_port = $syslog_remote_port
  }

  $source = $conf['source']
  $target = $conf['target']

  if ! $source {
    fail('syslogng::load_conf needs conf_source parameter.')
  }

  if ! $target {
    fail('syslogng::load_conf needs conf_target parameter.')
  }

  if ( $logstash_remote_server and $logstash_remote_port == undef ) or ( $logstash_remote_server == undef and $logstash_remote_port ) {
    fail('To use logstash with syslogng::load_conf logstash_remote_server and logstash_remote_port parameters are needed.')
  }

  $root_log_dir = $syslogng::params::root_log_dir

  if $log_dir {
    file {"syslogng_${log_dir}":
      ensure => directory,
      path   => "${root_log_dir}/${log_dir}",
    }
  }

  $path = "${syslogng::params::syslogng_config}/${syslogng::params::syslogng_config_dir}/${target}"

  if $source =~ /\.erb$/ {

    file {"load_conf_${name}":
      path    => $path,
      content => template("${module_name}/${source}"),
      notify  => Class['syslogng::service'],
    }

  }else{

    file {"load_conf_${name}":
      path    => $path,
      source  => "puppet:///modules/${module_name}/${source}",
      notify  => Class['syslogng::service'],
    }

  }
}
