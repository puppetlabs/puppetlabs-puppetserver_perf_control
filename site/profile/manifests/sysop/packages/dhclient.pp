class profile::sysop::packages::dhclient(
    $package_name = $profile::sysop::packages::dhclient::params::package_name
) inherits profile::sysop::packages::dhclient::params {
  package { $package_name : ensure => latest; }
}
