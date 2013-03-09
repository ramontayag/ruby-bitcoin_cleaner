require 'wait'
require "bitcoin_testnet/version"
require 'active_support/core_ext'

require 'bitcoin_testnet/detector'
require 'bitcoin_testnet/executor'
require 'bitcoin_testnet/booter'
require 'bitcoin_testnet/stopper'
require 'bitcoin_testnet/vcr_integrator'

module BitcoinTestnet

  mattr_accessor :dir
  @@dir = nil

  def self.start
    Booter.boot
  end

  def self.stop
    Stopper.stop
  end

  def self.configure_with_rspec_and_vcr!
    RSpec.configure do |c|
      c.before(:each) { VcrIntegrator.start }
      c.after(:each) { VcrIntegrator.stop }
    end
  end

end
