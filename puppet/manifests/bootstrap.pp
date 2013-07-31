# simple apache based web server with php and mysql

include augeasproviders

# defaults
Exec        { path => '/usr/sbin:/sbin:/bin:/usr/bin' }
Sshd_config { notify => Service[ 'sshd' ] }
User        { managehome => true }

file { '/etc/profile.d/aliases.sh':
    owner  => 'root', group => 'root', mode => '0644',
    source => 'puppet:///modules/configs/aliases.sh',
}

package { 'splunk':
    ensure   => installed,
    source   => 'file:///vagrant/sw/splunk-5.0.4-172409-linux-2.6-x86_64.rpm',
    provider => 'rpm',
}

file { '/etc/init.d/splunk':
    owner   => 'root', group => 'root', mode => '0700',
    source  => 'puppet:///modules/configs/splunk.init',
    require => Package[ 'splunk' ],
}

service { 'splunk':
    ensure  => 'running',
    enable  => true,
    require => File[ '/etc/init.d/splunk' ],
}

service { 'sshd':
    ensure => 'running',
    enable => 'true',
}

# sshd config
#
sshd_config { 'LoginGraceTime':
    value  => '30s',
}

sshd_config { 'AllowTcpForwarding':
    value => 'yes',
}

sshd_config { 'PermitRootLogin':
    value  => 'yes',
}

sshd_config { 'AllowUsers':
    value  => [ 'root', 'vagrant' ],
}

sshd_config { 'MaxAuthTries':
    value  => '3',
}

sshd_config { 'PasswordAuthentication':
    value  => 'yes',
}

# Setup sudo
file { 'sudo_wheel':
    tag     => 'setup',
    path    => '/etc/sudoers.d/99_wheel',
    owner   => 'root', group => 'root', mode => '0440',
    content => "%wheel ALL = (ALL) ALL\n",
}

augeas { 'sudo_include_dir':
    tag     => 'setup',
    context => '/files/etc/sudoers',
    changes => 'set #includedir "/etc/sudoers.d"',
}
