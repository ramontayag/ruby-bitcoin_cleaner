module BitcoinTestnet
  class Booter

    def self.boot(*args)
      self.new(*args).boot
    end

    def boot
      if Detector.exists?
        Stopper.stop
      else
        Executes.command "make clean"
      end

      thread = Thread.new do
        Executes.command "make start"
      end

      Wait.new.until do
        thread.status == false && Executes.command("make getinfo")
      end

      unless Detector.exists?
        fail "The bitcoin processes didn't seem to start. Please ensure that the bitcoin testnet servers started at `#{BitcoinTestnet.dir}`"
      end
    end

  end
end
