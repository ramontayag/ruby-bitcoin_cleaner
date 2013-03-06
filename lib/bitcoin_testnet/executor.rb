module BitcoinTestnet
  class Executor

    def self.execute(*args)
      self.new(*args).execute
    end

    def initialize(*commands)
      @commands = commands
    end

    def execute
      Dir.chdir BitcoinTestnet.dir do
        commands = @commands.map { |c| "#{c} > /dev/null"}
        system commands.join(' && ')
      end
    end

  end
end
