class role::by_size::medium {
  include ::profile::tomcat::basic
  include ::profile::postgresql::basic
  include ::profile::users
  include ::profile::sysop::packages

  include ::profile::motd

  include ::profile::hiera_check
}
