class role_nexus_server {

  # puppetlabs-java
  # NOTE: Nexus requires
  class { '::java': }

  group { 'nexus':
    ensure => present,
    system => true
  }

  user { 'nexus':
    ensure  => present,
    comment => 'Nexus user',
    gid     => 'nexus',
    home    => '/srv/nexus',
    shell   => '/bin/bash', # unfortunately required to start application via script.
    system  => true,
    require => Group['nexus']
  }

  class { '::nexus':
    version        => '2.8.0',
    revision       => '05'
  }

  Class['::java'] -> Group[nexus] -> User[nexus] -> Class['::nexus']

}
