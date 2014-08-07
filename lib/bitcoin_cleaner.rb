require 'wait'
require "bitcoin_cleaner/version"
require 'active_support/core_ext'

require 'bitcoin_cleaner/detector'
require 'bitcoin_cleaner/executor'
require 'bitcoin_cleaner/booter'
require 'bitcoin_cleaner/stopper'
require 'bitcoin_cleaner/executes'
require 'bitcoin_cleaner/prepares_command'
require 'bitcoin_cleaner/vcr_integrator'

module BitcoinCleaner

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
        interaction.ignore! if BitcoinCleaner.current_test.exception
      end
    end
  end

end
