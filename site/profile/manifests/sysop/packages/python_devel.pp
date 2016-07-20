class profile::sysop::packages::python_devel(
    $package_name = $profile::sysop::packages::python_devel::params::package_name
) inherits profile::sysop::packages::python_devel::params {
  package { $package_name : ensure => latest; }
}
