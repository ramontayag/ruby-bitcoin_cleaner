module BitcoinCleaner
  class Executor

    def self.execute(*args)
      self.new(*args).execute
    end

    def initialize(*commands)
      @commands = commands
    end

    def execute
      Dir.chdir BitcoinCleaner.dir do
        commands = @commands.map { |c| "#{c} > /dev/null 2>&1"}
        system commands.join(' && ')
      end
    end

  end
end
