# Define: motd::register
#
# Add a message to the MOTD
#
define motd::register (
  $content = undef,
  $order   = '20',
) {
  include ::motd

  if $content == undef {
    $body = $name
  } else {
    $body = $content
  }

  concat::fragment { "motd_fragment_${name}":
    target  => '/etc/motd',
    content => "    -- ${body}\n",
    order   => $order,
  }
}
