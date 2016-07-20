class profile::sysop::packages::jq(
    $package_name = $profile::sysop::packages::jq::params::package_name
) inherits profile::sysop::packages::jq::params {
  package { $package_name : ensure => latest, require => Yumrepo[epel]; }
}
