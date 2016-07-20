# Class: sudo
#
# Install and manage sudo
#
class sudo (
  $package_ensure = 'installed'
){
  include ::sudo::params

  $visudo_cmd   = $::sudo::params::visudo_cmd
  $sudoers_file = $::sudo::params::sudoers_file
  $sudoers_tmp  = $::sudo::params::sudoers_tmp
  $visiblepw    = $::sudo::params::visiblepw
  $sudo_pkg     = $::sudo::params::sudo_pkg

  # Darwin has it installed by default and not as a package.
  if $::operatingsystem != 'Darwin' {
    package { $sudo_pkg:
      ensure => $package_ensure,
      before => Exec['check-sudoers'],
    }
  }

  concat::fragment { 'sudoers-header':
    order   => '00',
    target  => $sudoers_tmp,
    content => template('sudo/sudoers.erb'),
  }

  concat { $sudoers_tmp:
    mode   => '0440',
    notify => Exec['check-sudoers'],
  }

  exec { 'check-sudoers':
    command => "${visudo_cmd} -cf ${sudoers_tmp} && cp ${sudoers_tmp} ${sudoers_file}",
    unless  => "/usr/bin/diff ${sudoers_tmp} ${sudoers_file}",
    require => Concat[$sudoers_tmp],
  }

  file{ $sudoers_file:
    owner => 'root',
    group => '0',
    mode  => '0440',
  }
}
