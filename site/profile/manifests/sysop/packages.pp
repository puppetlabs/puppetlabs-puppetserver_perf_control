# This is based on profile::sysop in puppetlabs-modules, to help us get our
#  catalog's package count up closer to what it would be in an ops catalog.
class profile::sysop::packages {
  include ::epel

  package { 'rsync': ensure => latest; }
  package { 'htop': ensure => latest, require => Yumrepo[epel]; }
  package { 'screen': ensure => latest; }
  package { 'tmux': ensure => latest; }
  package { 'tcpdump': ensure => latest; }
  package { 'nmap': ensure => latest; }
  package { 'strace': ensure => latest; }
  package { 'lsof': ensure => latest; }
  package { 'iotop': ensure => latest; }
  package { 'iftop': ensure => latest, require => Yumrepo[epel]; }
  package { 'dstat': ensure => latest; }
  package { 'mlocate': ensure => latest; }
  package { 'unzip': ensure => latest; }
  package { 'wget': ensure => latest; }
  package { 'ack': ensure => latest, require => Yumrepo[epel]; }
  package { 'bind-utils': ensure => latest; }
  package { 'vim-minimal': ensure => latest; }
  package { 'vim-common': ensure => latest; }
  package { 'vim-enhanced': ensure => latest; }
  package { 'curl': ensure => latest; }
  package { 'xz': ensure => latest; }
  package { 'bash': ensure => latest; }
  package { 'bash-completion': ensure => latest; }
  package { 'zsh': ensure => latest; }

  ## from here down are just random packages that I saw in the ops catalog

  include ::profile::sysop::packages::cronie
  include ::profile::sysop::packages::crontabs
  include ::profile::sysop::packages::ca_certificates
  include ::profile::sysop::packages::yum_utils
  include ::profile::sysop::packages::redhat_lsb
  include ::profile::sysop::packages::openssl
  include ::profile::sysop::packages::python_virtualenv
  include ::profile::sysop::packages::python_pip
  include ::profile::sysop::packages::python_devel
  include ::profile::sysop::packages::python
  include ::profile::sysop::packages::ruby
  include ::profile::sysop::packages::rubygems
  include ::profile::sysop::packages::jq
  include ::profile::sysop::packages::dhclient
  include ::profile::sysop::packages::postfix
  include ::profile::sysop::packages::ntp
  include ::profile::sysop::packages::openssh_clients
  include ::profile::sysop::packages::openssh_server

}