#puppet-syslogng

Puppet manifest to install and configure any syslog role

[![Build Status](https://secure.travis-ci.org/icalvete/puppet-syslogng.png)](http://travis-ci.org/icalvete/puppet-syslogng)

##Actions:

Puppet manifest to install and configure any syslog role

##Requires:

* Only works on Ubuntu
* [hiera](http://docs.puppetlabs.com/hiera/1/index.html)

##Example:

    class roles::syslog_remote_server inherits roles {

      syslogng::load_conf{'syslog_receiver':
        conf    => { source => '00receiver.conf.erb', target => '00sp_receiver.conf' },
        log_dir => hiera('sp_log_dir'),
        log     => hiera('sp_log'),
      }
    }

Where *00receiver.conf.erb* contains ...

    source s_udp {udp(port(514));};
    destination d_<%= @name -%> {file("<%= @root_log_dir -%>/<%= @log_dir -%>/<%= @log -%>");};
    log {source(s_udp); destination(d_<%= @name -%>);};

##TODO

This manifest must be **much more** general.

##Authors:

Israel Calvete Talavera <icalvete@gmail.com>
