class stall_things {
  file { '/tmp/foo' :
    content => stall_things(20)
  }
}
