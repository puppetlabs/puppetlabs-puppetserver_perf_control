class profile::sysop::packages::openssh_server(
    $package_name = $profile::sysop::packages::openssh_server::params::package_name
) inherits profile::sysop::packages::openssh_server::params {
  package { $package_name : ensure => latest; }
}
