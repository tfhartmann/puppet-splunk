require 'spec_helper'

describe 'splunk', :type => :class do
  describe "With type param set to 'hwf'" do
    let(:params) { { :type => 'hwf' } }

    context "on RedHat platform" do
      let(:facts) { { :osfamily => 'RedHat' } }

        it do 
          expect {
          should compile
          should create_class('splunk')
          should contain_class('splunk::outputs')
          should contain_class('splunk::config::mgmt_port')
          should contain_class('splunk::config::lwf')
          should contain_class('splunk::config::remove_uf')
          should contain_package('splunk')
	  should contain_service('splunk').with(
            'ensure' => 'running',
            'enable' => 'true'
          )
        }.to raise_error(Puppet::Error, /feature has not yet been implemented/)
      end
    end
  end
end
