class profile::sysop::packages::openssl(
    $package_name = $profile::sysop::packages::openssl::params::package_name
) inherits profile::sysop::packages::openssl::params {
  package { $package_name : ensure => latest; }
}
