module BitcoinTestnet
  class Booter

    def self.boot(*args)
      self.new(*args).boot
    end

    def boot
      if Detector.exists?
        puts "***** Testnet started manually; cleaning only"
        BitcoinTestnet.started_manually = true
        Cleaner.clean
      else
        puts "***** Starting Testnet. To make boot up faster, start the Testnet manually: `cd #{BitcoinTestnet.dir} && make start`"
        thread = Thread.new do
          Cleaner.clean
          Executor.execute "make start > /dev/null"
        end

        # Wait until the bitcoind servers have started and ready to accept. I've
        # found that the sweet spot was 2 seconds after the thread's status is
        # false
        wait_time = 0
        until wait_time == 5
          if thread.status == false
            sleep 2
            return
          end
          sleep 0.1
          wait_time += 0.1
        end

        unless Detector.exists?
          fail "The bitcoin processes didn't seem to start. Please ensure that the bitcoin testnet servers started at `#{BitcoinTestnet.dir}`"
        end
      end
    end

  end
end
