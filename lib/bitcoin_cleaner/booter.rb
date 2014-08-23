module BitcoinCleaner
  class Booter

    def self.boot(*args)
      Stopper.stop if Detector.exists?

      pid_file = File.join(BitcoinCleaner.dir, "regtest", "bitcoind.pid")
      thread = Thread.new do
        Executes.command "bitcoind -regtest -daemon -pid=#{pid_file}"
      end

      Wait.new.until do
        thread.status == false && Detector.exists?
      end

      if Detector.exists?
        generate_coins
      else
        message = [
          "The bitcoin processes didn't seem to start",
          "Please ensure that the bitcoind can be started",
        ]
        fail message*". "
      end
    end

    def self.generate_coins
      Executes.command "bitcoin-cli -regtest setgenerate true 101"
      Wait.new.until do
        default_account_balance = `bitcoin-cli -regtest getbalance ""`.to_f
        default_account_balance > 0
      end
    end

  end
end
