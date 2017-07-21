class profile::apache::basic {
  #copied from https://github.com/puppetlabs/puppetlabs-apache/blob/master/examples/vhost.pp

  # Base class. Declares default vhost on port 80 and default ssl
  # vhost on port 443 listening on all interfaces and serving
  # $apache::docroot
  class { '::apache':
    default_vhost => false,
  }

  include ::apache::mod::php
  include ::apache::mod::cgi
  include ::apache::mod::userdir
  include ::apache::mod::disk_cache
  include ::apache::mod::proxy
  include ::apache::mod::proxy_http

  # Most basic vhost
  apache::vhost { 'first.example.com':
    port    => '801',
    docroot => '/var/www/first',
  }

  # Vhost with different docroot owner/group/mode
  apache::vhost { 'second.example.com':
    port          => '800',
    docroot       => '/var/www/second',
    docroot_owner => 'root',
    docroot_group => 'root',
    docroot_mode  => '0770',
  }

  # Vhost with serveradmin
  apache::vhost { 'third.example.com':
    port        => '8000',
    docroot     => '/var/www/third',
    serveradmin => 'admin@example.com',
  }

  # Vhost with ssl (uses default ssl certs)
  apache::vhost { 'ssl.example.com':
    port    => '44443',
    docroot => '/var/www/ssl',
    ssl     => true,
  }
}
