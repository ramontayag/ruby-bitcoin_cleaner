module BitcoinCleaner
  class VcrIntegrator

    def self.start(*args)
      self.new(*args).start
    end

    def self.stop(*args)
      self.new(*args).stop
    end

    def initialize(rspec_example)
      BitcoinCleaner.current_test = @rspec_example = rspec_example
    end

    def start
      BitcoinCleaner.start if should_perform?
    end

    def stop
      BitcoinCleaner.stop if should_perform?
    end

    private

    def should_perform?
      DetermineRun.execute(@rspec_example)
    end

  end
end
