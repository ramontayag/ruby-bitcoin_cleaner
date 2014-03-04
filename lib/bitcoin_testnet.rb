require 'wait'
require "bitcoin_testnet/version"
require 'active_support/core_ext'

require 'bitcoin_testnet/detector'
require 'bitcoin_testnet/executor'
require 'bitcoin_testnet/booter'
require 'bitcoin_testnet/stopper'
require 'bitcoin_testnet/executes'
require 'bitcoin_testnet/prepares_command'
require 'bitcoin_testnet/vcr_integrator'

module BitcoinTestnet

  mattr_accessor :dir
  @@dir = nil

  mattr_accessor :current_test
  @@current_test = nil

  def self.start
    Booter.boot
  end

  def self.stop
    Stopper.stop
  end

  def self.configure_with_rspec_and_vcr!
    RSpec.configure do |c|
      c.before(:each) { VcrIntegrator.start(example) }
      c.after(:each) { VcrIntegrator.stop(example) }
    end

    VCR.configure do |c|
      c.before_record do |interaction|
        interaction.ignore! if BitcoinTestnet.current_test.exception
      end
    end
  end

end
