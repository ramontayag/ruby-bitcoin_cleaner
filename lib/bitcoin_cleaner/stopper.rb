module BitcoinCleaner
  class Stopper

    def self.stop
      self.new.stop
    end

    def stop
      kill_bitcoind if Detector.exists?
      Wait.new.until { !Detector.exists? }
      fail "Looks like it didn't stop" if Detector.exists?
      Executor.execute "make clean"
    end

    private

    def kill_bitcoind
      system %Q(kill -9 `ps -ef | grep "bitcoind -datadir=" | grep -v grep | awk '{print $2}'`)
    end
  end
end
