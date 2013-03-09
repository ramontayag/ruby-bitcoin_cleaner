module BitcoinTestnet
  class VcrIntegrator

    def self.start
      self.new.start
    end

    def self.stop
      self.new.stop
    end

    def start
      BitcoinTestnet.start if should_perform?
    end

    def stop
      BitcoinTestnet.stop if should_perform?
    end

    private

    def should_perform?
      cassette_exists? || allow_unused_http_interactions?
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
