module BitcoinCleaner
  class Executes

    def self.command(c)
      Dir.chdir BitcoinCleaner.dir
      prepared_command = PreparesCommand.for_silence(c)
      system prepared_command
    end

  end
end
