class profile::sysop::packages::crontabs(
    $package_name = $profile::sysop::packages::crontabs::params::package_name
) inherits profile::sysop::packages::crontabs::params {
  package { $package_name : ensure => latest; }
}
