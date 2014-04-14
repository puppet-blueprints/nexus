group { 'puppet': ensure  => present }

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
  include '::apt'
  include '::cron'
  include '::ntp'
  include '::postfix'
}
