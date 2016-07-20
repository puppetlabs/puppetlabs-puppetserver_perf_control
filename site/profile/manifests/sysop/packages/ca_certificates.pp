class profile::sysop::packages::ca_certificates(
    $package_name = $profile::sysop::packages::ca_certificates::params::package_name
) inherits profile::sysop::packages::ca_certificates::params {
  package { $package_name : ensure => latest; }
}
