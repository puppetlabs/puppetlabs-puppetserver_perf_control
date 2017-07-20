class role::by_size::large {
  include ::role::by_size::medium

  include ::profile::apache::basic
  include ::profile::influxdb::basic
  include rampup_profile_gitlab
  include ::profile::loop_through_file_resources
}
