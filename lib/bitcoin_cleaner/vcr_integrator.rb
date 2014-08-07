module BitcoinTestnet
  class VcrIntegrator

    def self.start(*args)
      self.new(*args).start
    end

    def self.stop(*args)
      self.new(*args).stop
    end

    def initialize(rspec_example)
      BitcoinTestnet.current_test = @rspec_example = rspec_example
    end

    def start
      BitcoinTestnet.start if should_perform?
    end

    def stop
      BitcoinTestnet.stop if should_perform?
    end

    private

    def should_perform?
      return false unless @rspec_example.metadata[:vcr]
      return true if !cassette_exists? && allow_unused_http_interactions?
      return true if !cassette_exists?
      false
    end

    def cassette_exists?
      VCR.current_cassette &&
        VCR.current_cassette.file &&
        File.exists?(VCR.current_cassette.file)
    end

    def allow_unused_http_interactions?
      VCR.configuration.
        default_cassette_options[:allow_unused_http_interactions]
    end

  end
end
