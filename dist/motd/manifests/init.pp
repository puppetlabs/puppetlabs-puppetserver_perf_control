# Class: motd
#
# Borrowed from https://github.com/ripienaar/puppet-concat
#
class motd {

  concat{ '/etc/motd':
    owner => 'root',
    mode  => '0644',
  }

  concat::fragment{ 'motd_header':
    target  => '/etc/motd',
    content => template('motd/motd.erb'),
    order   => '02',
  }

  # Place our custom /etc/issue
  file { '/etc/banner':
    ensure => 'present',
    source => 'puppet:///modules/motd/banner.txt',
    owner  => 'root',
    mode   => '0644',
  }
}
