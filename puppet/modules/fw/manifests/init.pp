class fw {

	if $::operatingsystemmajrelease == 5 {
		$input_chain = 'RH-Firewall-1-INPUT'
	} else {
		$input_chain = 'INPUT'
	}

  resources { "firewall":
    purge => true
  }
  Firewall {
    before  => Class['fw::post'],
    require => Class['fw::pre'],
  }
  class { ['fw::pre', 'fw::post']: }
  class { 'firewall': }
}