module BitcoinCleaner
  class Executes

    def self.command(c)
      prepared_command = PreparesCommand.for_silence(c)
      system prepared_command
    end

  end
end
