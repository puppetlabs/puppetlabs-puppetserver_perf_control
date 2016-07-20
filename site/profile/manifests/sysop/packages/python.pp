class profile::sysop::packages::python(
    $package_name = $profile::sysop::packages::python::params::package_name
) inherits profile::sysop::packages::python::params {
  package { $package_name : ensure => latest; }
}
