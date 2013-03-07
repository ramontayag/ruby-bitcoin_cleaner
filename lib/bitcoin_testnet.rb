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

  def self.configure_with_rspec_and_vcr!
    RSpec.configure do |c|
      c.before(:each) do
        if VCR.current_cassette
          cassette_file = VCR.current_cassette.file
          BitcoinTestnet.start unless File.exists?(cassette_file)
        end
      end

      c.after(:each) do
        if VCR.current_cassette
          cassette_file = VCR.current_cassette.file
          BitcoinTestnet.stop unless File.exists?(cassette_file)
        end
      end
    end
  end

end
