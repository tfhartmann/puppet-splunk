Puppet::Type.newtype(:splunk_search_peers) do
  @doc = %q{Adds search peers to a Splunk Node
  Example:

    splunk_search_peers {['node1', 'node2']:
      ensure => present,
    }
  }
  ensurable
  newproperty(:user) do
    desc "Admin User to use when connecting to the API"
    validate do |value|
      unless value =~ /^\w+/
        raise ArgumentError, "%s is not a valid user name" % value
    end
  end
  newproperty(:password) do
    desc "Password to use when connecting to the API"
  end
end
