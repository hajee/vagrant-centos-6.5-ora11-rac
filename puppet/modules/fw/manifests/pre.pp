class fw::pre {
  Firewall {
    require => undef,
  }
   # Default firewall rules
  firewall { '000 accept all to lo interface':
    chain   => $fw::input_chain,
    proto   => 'all',
    iniface => 'lo',
    action  => 'accept',
  }

  firewall { '001 accept all icmp':
    chain   => $fw::input_chain,
    proto   => 'icmp',
    action  => 'accept',
  }

  firewall { '002 accept related established rules':
    chain   => $fw::input_chain,
    state   => ['RELATED', 'ESTABLISHED'],
    action  => 'accept',
  }

  firewall { '003 allow SSH access':
    port   => 22,
    proto  => tcp,
    action => accept,
  }
}

