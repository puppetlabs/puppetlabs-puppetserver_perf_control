class profile::sysop::packages::python_pip(
    $package_name = $profile::sysop::packages::python_pip::params::package_name
) inherits profile::sysop::packages::python_pip::params {
  package { $package_name : ensure => latest, require => Yumrepo[epel]; }
}
