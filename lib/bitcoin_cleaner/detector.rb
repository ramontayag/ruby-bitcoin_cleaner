module BitcoinCleaner
  class Detector

    def self.exists?
      processes.size >= 1
    end

    private

    def self.processes
      `ps -ef | grep "bitcoind -regtest" | grep -v grep`.split("\n")
    end

  end
end
