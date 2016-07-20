class profile::sysop::packages::yum_utils(
    $package_name = $profile::sysop::packages::yum_utils::params::package_name
) inherits profile::sysop::packages::yum_utils::params {
  package { $package_name : ensure => latest; }
}
