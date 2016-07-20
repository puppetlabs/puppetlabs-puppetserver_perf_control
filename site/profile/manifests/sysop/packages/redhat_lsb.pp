class profile::sysop::packages::redhat_lsb(
    $package_name = $profile::sysop::packages::redhat_lsb::params::package_name
) inherits profile::sysop::packages::redhat_lsb::params {
  package { $package_name : ensure => latest; }
}
