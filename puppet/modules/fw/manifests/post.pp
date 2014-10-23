class fw::post {
  firewall { '999 icmp host prohibited':
  	chain   => $fw::input_chain,
    action  => 'reject',
	reject => 'icmp-host-prohibited',
    before  => undef,
  }
}

