import "role_nexus_server"
import "role_nexus_nginx_proxy"

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

node default {
  include role_nexus_server
  #include role_nexus_nginx_proxy
}
