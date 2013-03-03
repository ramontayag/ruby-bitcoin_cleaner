require "bitcoin_testnet/version"
require 'active_support/core_ext/module'

require 'bitcoin_testnet/detector'
require 'bitcoin_testnet/booter'
require 'bitcoin_testnet/cleaner'
require 'bitcoin_testnet/executor'
require 'bitcoin_testnet/janitor'

module BitcoinTestnet
  TESTNET_DIR = File.expand_path File.join(File.dirname(__FILE__), '..', 'testnet')
  mattr_accessor :started_manually
  @@started_manually = false

  def self.start
    Booter.boot
  end

  def self.clean
    Cleaner.clean
  end

  def self.stop
    Janitor.sweep
  end
end
