module BitcoinTestnet
  class Detector

    def self.processes
      self.new.processes
    end

    def self.exists?
      self.new.exists?
    end

    def processes
      `ps -ef | grep "bitcoind -datadir=" | grep -v grep`.split("\n")
    end

    def exists?
      processes.size == 2
    end

  end
end
