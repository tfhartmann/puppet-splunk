require 'spec_helper'

describe 'splunk', :type => :class do
  describe "With type param set to 'foo'" do
    let(:params) { { :type => 'foo' } }

    context "on RedHat platform" do
      let(:facts) { { :osfamily => 'RedHat' } }

        it do 
          expect {
          should compile
          should create_class('splunk')
          should contain_package('splunk')
	  should contain_service('splunk').with(
            'ensure' => 'running',
            'enable' => 'true'
          )
        }.to raise_error(Puppet::Error, /is not a supported Splunk type/)
      end
    end
  end
end
