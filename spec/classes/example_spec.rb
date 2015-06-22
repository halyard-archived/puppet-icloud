require 'spec_helper'

describe 'icloud' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts
        end

        context "icloud class without any parameters" do
          let(:params) {{ }}

          it { is_expected.to compile.with_all_deps }

          it { is_expected.to contain_class('icloud::params') }
          it { is_expected.to contain_class('icloud::install').that_comes_before('icloud::config') }
          it { is_expected.to contain_class('icloud::config') }
          it { is_expected.to contain_class('icloud::service').that_subscribes_to('icloud::config') }

          it { is_expected.to contain_service('icloud') }
          it { is_expected.to contain_package('icloud').with_ensure('present') }
        end
      end
    end
  end

  context 'unsupported operating system' do
    describe 'icloud class without any parameters on Solaris/Nexenta' do
      let(:facts) {{
        :osfamily        => 'Solaris',
        :operatingsystem => 'Nexenta',
      }}

      it { expect { is_expected.to contain_package('icloud') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
