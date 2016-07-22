# Define: sudo::allowgroup
#
# Allow a posix group to sudo root
#
define sudo::allowgroup {
  include ::sudo
  include ::sudo::params

  $sudoers_tmp  = $::sudo::params::sudoers_tmp

  concat::fragment { "sudoers-group-${name}":
    target  => $sudoers_tmp,
    content => "%${name} ALL=(ALL) NOPASSWD: ALL\n",
  }
}
