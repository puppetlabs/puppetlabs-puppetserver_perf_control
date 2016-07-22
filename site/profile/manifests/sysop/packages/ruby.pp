class profile::sysop::packages::ruby(
    $package_name = $profile::sysop::packages::ruby::params::package_name
) inherits profile::sysop::packages::ruby::params {
  package { $package_name : ensure => latest; }
}
