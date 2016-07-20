class profile::sysop::packages::openssh_clients(
    $package_name = $profile::sysop::packages::openssh_clients::params::package_name
) inherits profile::sysop::packages::openssh_clients::params {
  package { $package_name : ensure => latest; }
}
