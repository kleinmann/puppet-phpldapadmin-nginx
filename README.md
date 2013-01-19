# phpLDAPadmin Module with nginx support

Uwe Kleinmann <uwe@kleinmann.org>

This module installs phpLDAPadmin with an accompanying nginx vhost via Puppet.
It is specifically for Ubuntu 12.10 and hasn't been tested with anything else.

# Usage
<pre>
  class { 'phpldapadmin':
    domain       => 'phpldapadmin.example.com',
    ldap_name    => 'My LDAP Server',
    ldap_host    => 'localhost',
    ldap_port    => 389,
    ldap_base_dn => '',
    ldap_tls     => false,
  }
</pre>
