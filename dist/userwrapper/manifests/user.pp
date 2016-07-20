define userwrapper::user (
  $key,
) {

  include ::userwrapper

  File { owner => $name, group => $name }

  $homedir = "/home/${name}"
  $home_source = "puppet:///modules/userwrapper/userdirs/${name}"

  user { $name:
    ensure     => present,
    home       => $homedir,
    managehome => false,
  } ->

  file { "/var/users/${name}":
    ensure  => present,
    replace => false,
    content => "${name}",
    require => File['/var/users'],
  } ->

  file { $homedir:
    ensure  => directory,
    recurse => remote,
    source  => [ $home_source, 'puppet:///modules/userwrapper/userdir_default' ],
  } ->

  ssh_authorized_key { "${name}@${name}":
    ensure  => present,
    key     => $key,
    type    => 'ssh-rsa',
    user    => $name,
    require => File[$homedir],
  } ->

  sudo::entry { "${name}: ls as root":
    entry => "${name} ALL=(ALL) NOPASSWD: /usr/bin/ls"
  }
}
