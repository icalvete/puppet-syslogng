class syslogng::config {

  file {'syslogng_config_dir':
    ensure => directory,
    path   => "${syslogng::params::syslogng_config}/${syslogng::params::syslogng_config_dir}",
    owner  => 'root',
    group  => 'root',
    mode   => '0755'
  }

  file {'syslogng_config_file':
    ensure => present,
    path   => "${syslogng::params::syslogng_config}/${syslogng::params::syslogng_config_file}",
    source => "puppet:///modules/${module_name}/${syslogng::params::syslogng_config_file}",
    owner  => 'root',
    group  => 'root',
    mode   => '0644'
  }
}
