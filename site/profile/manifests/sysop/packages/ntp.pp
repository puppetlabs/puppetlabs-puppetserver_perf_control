class profile::sysop::packages::ntp(
    $package_name = $profile::sysop::packages::ntp::params::package_name
) inherits profile::sysop::packages::ntp::params {
  package { $package_name : ensure => latest; }
}
