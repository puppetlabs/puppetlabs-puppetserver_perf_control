class profile::sysop::packages::python_virtualenv(
    $package_name = $profile::sysop::packages::python_virtualenv::params::package_name
) inherits profile::sysop::packages::python_virtualenv::params {
  package { $package_name : ensure => latest; }
}
