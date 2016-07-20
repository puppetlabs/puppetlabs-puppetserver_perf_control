class profile::sysop::packages::puppet_agent(
    $package_name = $profile::sysop::packages::puppet_agent::params::package_name
) inherits profile::sysop::packages::puppet_agent::params {
  package { $package_name : ensure => latest; }
}
