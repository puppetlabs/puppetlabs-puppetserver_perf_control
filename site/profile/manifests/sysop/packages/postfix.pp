class profile::sysop::packages::postfix(
    $package_name = $profile::sysop::packages::postfix::params::package_name
) inherits profile::sysop::packages::postfix::params {
  package { $package_name : ensure => latest; }
}
