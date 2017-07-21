class profile::loop_through_file_resources {

  $my_array = profile::make_array(100)

  $file = '/tmp/test'

  $my_array.each | $num | {
    $more_num = $num + 1

    file_line { "${num}" :
      path => $file,
      line => "${num}=${more_num}",
    }

    $num_num = $num + 200
    $num_num_num = $num + 250

    ini_setting { "${num}" :
      ensure => present,
      path   => $file,
      section => 'default',
      setting => "${num_num}",
      value   => "${num_num_num}",
    }
  }
}
