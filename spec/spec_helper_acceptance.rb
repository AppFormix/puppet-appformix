require 'beaker-rspec/spec_helper'
require 'beaker-rspec/helpers/serverspec'
require 'beaker/puppet_install_helper'

run_puppet_install_helper

RSpec.configure do |c|
  # Project root
  proj_root = File.expand_path(File.join(File.dirname(__FILE__), '..'))

  # Readable test descriptions
  c.formatter = :documentation

  # Configure all nodes in nodeset
  c.before :suite do
    # Install module and dependencies
    hosts.each do |host|
      copy_module_to(host, :source => proj_root, :module_name => 'appformix')
      #if fact('osfamily') == 'Debian'
      #  on host, puppet('module','install','puppetlabs-apt', '--version 1.8.0', '--force'), { :acceptable_exit_codes => [0,1] }
      #end
      #on host, puppet('module','install','puppetlabs-stdlib'), { :acceptable_exit_codes => [0,1] }
      #on host, puppet('module','install','puppetlabs-concat', '--version 1.1.1', '--force'), { :acceptable_exit_codes => [0,1] }
    end
  end
end
