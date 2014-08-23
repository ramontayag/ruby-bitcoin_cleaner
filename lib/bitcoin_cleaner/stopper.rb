module BitcoinCleaner
  class Stopper

    def self.stop
      kill_bitcoind if Detector.exists?
      Wait.new.until { !Detector.exists? }
      fail "Looks like it didn't stop" if Detector.exists?
      remove_regtest_dir
    end

    private

    def self.kill_bitcoind
      system %Q(kill -9 `ps -ef | grep "bitcoind -regtest" | grep -v grep | awk '{print $2}'`)
    end

    def self.remove_regtest_dir
      regtest_dir = File.join(BitcoinCleaner.dir, "regtest")
      FileUtils.rm_rf regtest_dir
    end

  end
end
