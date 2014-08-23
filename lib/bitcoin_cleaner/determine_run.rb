module BitcoinCleaner
  class DetermineRun

    def self.execute(rspec_example)
      return true unless defined?(VCR)

      bitcoin_cleaner_metadata = rspec_example.metadata[:bitcoin_cleaner]
      vcr_metadata = rspec_example.metadata[:vcr]
      return false unless bitcoin_cleaner_metadata == true
      if vcr_metadata != true && !vcr_metadata.nil?
        return false if vcr_metadata[:record] == :once && cassette_exists?
      end
      true
    end

    private

    def self.cassette_exists?
      CheckVcrCassette.exists?(VCR.current_cassette)
    end

  end
end
