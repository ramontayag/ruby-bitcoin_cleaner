module BitcoinTestnet
  class Janitor

    def self.sweep(*args)
      self.new(*args).sweep
    end

    def sweep
      if BitcoinTestnet.started_manually
        puts "\n***** Since Testnet started manually; cleaning only. If you want to stop it, run: `cd #{TESTNET_DIR} && make stop`"
        Cleaner.clean
      else
        puts "\n***** Since the BitcoinTestnet started the Testnet, stop and clean"
        Executor.execute "make stop > /dev/null"
        Cleaner.clean
      end
    end

  end
end
