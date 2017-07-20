class profile::influxdb::basic {

  $graphite_config = {
      'enabled'           => true, # not default
  }

  $udp_options = [
    { 'enabled'       => true,
      'bind-address'  => ':8089',
      'database'      => 'udp_db1',
      'batch-size'    => 10000,
      'batch-timeout' => '1s',
      'batch-pending' => 5,
    },
    { 'enabled'       => true,
      'bind-address'  => ':8090',
      'database'      => 'udp_db2',
      'batch-size'    => 10000,
      'batch-timeout' => '1s',
      'batch-pending' => 5,
    },
]

  class { 'influxdb::server':
    manage_repos     => true,
    graphite_options => $graphite_config,
    udp_options      => $udp_options,
  }

}
