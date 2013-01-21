class phpldapadmin(
  $domain = $::fqdn,
  $ldap_name = 'My LDAP Server',
  $ldap_host = 'localhost',
  $ldap_port = 389,
  $ldap_base_dn = '',
  $ldap_tls = false,
) {

  package { 'php5-ldap':
    ensure => present,
    name   => 'php5-ldap',
  }

  package { 'phpldapadmin':
    ensure   => present,
    name     => 'phpldapadmin',
    provider => 'dpkg',
    source   => '/tmp/phpldapadmin_1.2.3_all.deb',
    require  => File['phpldapadmin-package'],
  }

  file { 'phpldapadmin-package':
    ensure  => 'present',
    path    => '/tmp/phpldapadmin_1.2.3_all.deb',
    owner   => 'root',
    group   => 'root',
    mode    => 0644,
    source  => 'puppet:///modules/phpldapadmin/phpldapadmin_1.2.3_all.deb',
  }

  file { 'phpldapadmin-nginx-vhost':
    ensure  => 'present',
    path    => '/etc/nginx/conf.d/phpldapadmin_vhost.conf',
    owner   => 'root',
    group   => 'root',
    mode    => 0600,
    content => template('phpldapadmin/nginx_vhost.erb'),
  }

  file { 'phpldapadmin-configuration':
    ensure  => 'present',
    path    => '/var/www/phpldapadmin/config/config.php',
    owner   => 'www-data',
    group   => 'www-data',
    mode    => 0644,
    content => template('phpldapadmin/config.php.erb'),
    require => Package['phpldapadmin'],
  }
}
