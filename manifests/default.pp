import "nginx_proxy"

group { 'puppet': ensure => present }

## if is_vagrant is defined, then we're running under Vagrant
if $::is_vagrant {
    $data_center = 'vagrant'
} else {
    $data_center = 'default'
}

stage { 'preinstall':
  before => Stage['main']
}
 
class apt_get_update {
  exec { 'apt-get -y update':
    command => '/usr/bin/apt-get update',
    onlyif => "/bin/bash -c 'type -P apt-get'",
  }
}
 
class { 'apt_get_update':
  stage => preinstall
}

hiera_include('classes')
create_resources(sudo::conf, hiera('sudo::rules'))

class role_nexus_server {
  # puppetlabs-java
  # NOTE: Nexus requires Java JRE
  class { '::java': }

  group { 'nexus':
    ensure => present,
    system => true
  }

  user { 'nexus':
    ensure => present,
    comment => 'Nexus user',
    gid     => 'nexus',
    home    => '/srv/nexus',
    shell   => '/bin/bash', # unfortunately required to start application via script.
    system  => true,
    require => Group['nexus']
  }

  class { '::nexus':
    version        => '2.8.0',
    revision       => '05',
    nexus_user     => 'nexus',
    nexus_group    => 'nexus',
    nexus_root     => '/srv',
  }

  Class['::java'] -> Group[$nexus::nexus_group] -> User[$nexus::nexus_user] -> Class['::nexus']
}

node default {
  include role_nexus_server
  #include nginx_proxy
}
