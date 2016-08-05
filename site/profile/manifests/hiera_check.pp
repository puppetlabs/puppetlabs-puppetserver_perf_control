# This is just a simple class that looks up a few hiera values
#  and validates that they are available, to ensure that hiera is
#  configured properly so it will be exercised during perf testing.
class profile::hiera_check(
  $param_to_validate = "wrong value"
) {

  # Validate that the class param to this class was injected from hiera
  if ($param_to_validate != "correct value") {
    fail("Hiera lookup appears to have failed; param_to_validate: '${param_to_validate}'")
  }

  # Validate data from the various levels of the hierarchy
  $location = hiera('location')
  if ($location != "portland") {
    fail("Hiera lookup appears to have failed; location: '${location}'")
  }

  $sitename = hiera('sitename')
  if ($sitename != "mycompany") {
    fail("Hiera lookup appears to have failed; sitename: '${sitename}'")
  }

  $location_checkfield = hiera('location::portland::hiera_check_field')
  if ($location_checkfield != "correct value") {
    fail("Hiera lookup appears to have failed; location_checkfield: '${location_checkfield}'")
  }

  $location_stage_checkfield = hiera('location::portland::prod::hiera_check_field')
  if ($location_stage_checkfield != "correct value") {
    fail("Hiera lookup appears to have failed; location_stage_checkfield: '${location_stage_checkfield}'")
  }

  $group_checkfield = hiera('groups::pgtomcat::hiera_check_field')
  if ($group_checkfield != "correct value") {
    fail("Hiera lookup appears to have failed; group_checkfield: '${group_checkfield}'")
  }

  $group_stage_checkfield = hiera('groups::pgtomcat::prod::hiera_check_field')
  if ($group_stage_checkfield != "correct value") {
    fail("Hiera lookup appears to have failed; group_stage_checkfield: '${group_stage_checkfield}'")
  }

  $group_location_stage_checkfield = hiera('groups::pgtomcat::portland::prod::hiera_check_field')
  if ($group_location_stage_checkfield != "correct value") {
    fail("Hiera lookup appears to have failed; group_location_stage_checkfield: '${group_location_stage_checkfield}'")
  }

  $group_function_checkfield = hiera('groups::pgtomcat::app::hiera_check_field')
  if ($group_function_checkfield != "correct value") {
    fail("Hiera lookup appears to have failed; group_function_checkfield: '${group_function_checkfield}'")
  }

  $group_function_stage_checkfield = hiera('groups::pgtomcat::app::prod::hiera_check_field')
  if ($group_function_stage_checkfield != "correct value") {
    fail("Hiera lookup appears to have failed; group_function_stage_checkfield: '${group_function_stage_checkfield}'")
  }

  $domain_checkfield = hiera('domains::pgtomcat_mycompany_org::hiera_check_field')
  if ($domain_checkfield != "correct value") {
    fail("Hiera lookup appears to have failed; domain_checkfield: '${domain_checkfield}'")
  }

  $domain_stage_checkfield = hiera('domains::pgtomcat_mycompany_org::stages::prod::hiera_check_field')
  if ($domain_stage_checkfield != "correct value") {
    fail("Hiera lookup appears to have failed; domain_stage_checkfield: '${domain_stage_checkfield}'")
  }

  $domain_group_checkfield = hiera('domains::pgtomcat_mycompany_org::groups::pgtomcat::hiera_check_field')
  if ($domain_group_checkfield != "correct value") {
    fail("Hiera lookup appears to have failed; domain_group_checkfield: '${domain_group_checkfield}'")
  }

  # Note that we are omitting any checks from the levels that use fqdn/hostname,
  # because those will be very volatile in gatling testing.

}
