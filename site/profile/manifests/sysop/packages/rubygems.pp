class profile::sysop::packages::rubygems(
    $package_name = $profile::sysop::packages::rubygems::params::package_name
) inherits profile::sysop::packages::rubygems::params {
  package { $package_name : ensure => latest; }
}
