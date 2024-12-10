define syslogng::load_conf_v2 (

  $source = undef,
  $target = undef

) {

  if ! $source {
    fail('roles:::syslogng:load_conf_v2 needs source parameter.')
  }
    
  if ! $target {
    fail('roles:::syslogng:load_conf_v2 needs target parameter.')
  }


  if $target =~ /\.erb$/ {

    file {"load_script_${name}":
      path    => $target,
      content => template("${source}"),
      notify  => Class['syslogng::service'],
    }
  }else{

    file {"load_script_${name}":
      path   => $target,
      source => $source,
      notify  => Class['syslogng::service'],
    }
  }
}
