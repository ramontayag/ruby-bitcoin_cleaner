require 'wait'
require "bitcoin_testnet/version"
require 'active_support/core_ext/module'

require 'bitcoin_testnet/detector'
require 'bitcoin_testnet/executor'
require 'bitcoin_testnet/booter'
require 'bitcoin_testnet/stopper'

module BitcoinTestnet
  mattr_accessor :dir
  @@dir = nil

  def self.start
    Booter.boot
  end

  def self.stop
    Stopper.stop
  end

  def self.configure_rspec!
    RSpec.configure do |c|
      c.before(:each) { BitcoinTestnet.start }
      c.after(:suite) { BitcoinTestnet.stop }
    end
  end
end
