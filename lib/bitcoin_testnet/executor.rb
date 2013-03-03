module BitcoinTestnet
  class Executor

    def self.execute(*args)
      self.new(*args).execute
    end

    def initialize(*commands)
      @commands = commands
    end

    def execute
      commands = ["cd #{TESTNET_DIR}"] + @commands
      puts "Executing: #{commands.join(' && ')}"
      system commands.join(' && ')
    end

  end
end
