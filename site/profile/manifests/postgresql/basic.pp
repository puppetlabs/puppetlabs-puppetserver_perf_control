class profile::postgresql::basic {
  class { 'postgresql::server':
    ip_mask_deny_postgres_user => '0.0.0.0/32',
    ip_mask_allow_all_users    => '0.0.0.0/0',
    listen_addresses           => '*',
    postgres_password          => 'TPSrep0rt!',
  }

  postgresql::server::db { 'mydatabasename':
    user     => 'mydatabaseuser',
    password => postgresql_password('mydatabaseuser', 'mypassword'),
  }

  postgresql::server::role { 'marmot':
    password_hash => postgresql_password('marmot', 'mypasswd'),
  }

  postgresql::server::database_grant { 'mydatabasename':
    privilege => 'ALL',
    db        => 'mydatabasename',
    role      => 'marmot',
  }

  postgresql::server::pg_hba_rule { 'allow application network to access app database':
    description => "Open up PostgreSQL for access from 200.1.2.0/24",
    type        => 'host',
    database    => 'app',
    user        => 'app',
    address     => '200.1.2.0/24',
    auth_method => 'md5',
  }
}
