# A Puppetfile for a control repo that can be used for Puppet Server / PE perf testing

mod 'stahnma/epel', '1.2.2'

# Modules that have been extracted from core Puppet
mod 'puppetlabs/augeas_core', '1.0.0'
mod 'puppetlabs/sshkeys_core', '1.0.0'
mod 'puppetlabs/yumrepo_core', '1.0.0'

# Modules required to get a tomcat server up and running
mod 'puppetlabs/tomcat', '1.5.0'
mod 'puppetlabs/stdlib', '4.12.0'
mod 'nanliu/staging', '1.0.3'
mod 'puppetlabs/concat', '2.1.0'
mod 'puppetlabs/java', '1.6.0'

# Modules required to get a postgres server up and running
mod 'puppetlabs/postgresql', '4.9.0'
mod 'puppetlabs/apt', '2.2.2'

# Seeing issues with latest version of gatling
#mod 'rampup_profile_gitlab',
#  :git    => 'https://github.com/Puppet-RampUpProgram/rampup_profile_gitlab',
#  :commit => '4a5599882c0e2d716be53b0f543be2af90ec6a94'
mod 'golja/influxdb', '4.0.0'
mod 'vshn/gitlab', '1.14.0'
mod 'puppetlabs/apache', '1.11.0'

##################################################################################
## MODULES BELOW THIS LINE ARE NOT USED BY ANY ROLES/PROFILES
##################################################################################

# Enable collection of Puppet api-endpoint metrics
mod 'puppetlabs-puppet_metrics_collector', '5.1.0'

# Extra modules just to increase the total amount of code in the puppet environment
## "Additional modules to complement PE installation"
mod 'hunner/hiera', '2.0.1'
mod 'puppetlabs/puppetserver_gem', '0.2.0'
mod 'puppetlabs/inifile', '1.2.0'
mod 'puppetlabs/hocon', '0.9.4'
mod 'puppetlabs/vcsrepo', '1.3.2'
mod 'puppet/archive', '0.5.1'

## Basic linux host management
mod 'puppetlabs/accounts', '1.0.0'
mod 'jlambert121/yum', '0.2.1'
mod 'puppetlabs/ntp', '4.2.0'
mod 'puppetlabs/firewall', '1.8.1'
mod 'saz/rsyslog', '3.5.1'

## Advanced linux host management
mod 'garethr/docker', '5.2.0'

## Common tools in an infrastructure
mod 'camptocamp/openldap', '1.14.0'
mod 'arioch/redis', '1.2.2'
mod 'saz/memcached', '2.8.1'
mod 'puppetlabs/haproxy', '1.4.0'
mod 'jfryman/nginx', '0.3.0'
mod 'rtyler/jenkins', '1.6.1'
mod 'sensu/sensu', '2.1.0'
mod 'bfraser/grafana', '2.5.0'

mod 'elasticsearch/elasticsearch', '0.11.0'
mod 'elasticsearch/logstash', '0.6.4'
mod 'elasticsearch/logstashforwarder', '0.1.1'

mod 'puppetlabs/java_ks', '1.4.1'

## Basic Windows host management
mod 'puppetlabs/acl', '1.1.2'
mod 'puppetlabs/reboot', '1.2.1'
mod 'chocolatey/chocolatey', '1.2.3'
mod 'puppetlabs/powershell', '2.0.1'
mod 'puppetlabs/registry', '1.1.3'
mod 'puppetlabs/wsus_client', '1.0.2'
mod 'badgerious/windows_env', '2.2.2'
mod 'puppet/windows_firewall', '1.0.3'
mod 'puppet/windows_autoupdate', '1.1.0'
mod 'puppet/dotnet', '1.0.2'
mod 'puppet/windowsfeature', '1.1.0'
mod 'puppet/windows_eventlog', '1.1.1'

## Advanced Windows host management
mod 'chocolatey/chocolatey_server', '0.0.4'
# this apparently requires a PE license
#mod 'puppetlabs/sqlserver', '1.1.2'
mod 'puppet/iis', '2.0.2'
mod 'puppet/graphite_powershell', '1.0.1'

## And while we're at it, lets do this all in the cloud
mod 'puppetlabs/aws', '1.4.0'

## i18n, just putting this here created a perf issue in the past
mod 'eputnam-i18ndemo', '0.3.0'
