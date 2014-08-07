module BitcoinCleaner
  class PreparesCommand

    def self.for_silence(command)
      "#{command} > /dev/null 2>&1"
    end

  end
end
