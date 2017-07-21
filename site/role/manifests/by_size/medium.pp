class role::by_size::medium {
  include ::role::by_size::small

  include ::profile::users
  include ::profile::sysop::packages

  include ::profile::motd

  include ::profile::hiera_check
}
