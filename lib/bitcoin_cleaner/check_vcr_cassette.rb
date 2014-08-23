module BitcoinCleaner
  class CheckVcrCassette

    def self.exists?(cassette)
      !!(cassette && cassette.file && File.exists?(cassette.file))
    end

  end
end
