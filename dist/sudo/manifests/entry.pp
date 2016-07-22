define sudo::entry ($entry) {
  include ::sudo
  include ::sudo::params

  $sudoers_tmp  = $::sudo::params::sudoers_tmp
  $content = "# ${name}\n${entry}\n"

  concat::fragment { "sudoers-entry-${name}":
    target  => $sudoers_tmp,
    content => $content,
  }
}
