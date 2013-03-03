module BitcoinTestnet
  class Executor

    def self.execute(*args)
      self.new(*args).execute
    end

    def initialize(*commands)
      @commands = commands
    end

    def execute
      commands = ["cd #{BitcoinTestnet.dir}"] + @commands
      system commands.join(' && ')
    end

  end
end
