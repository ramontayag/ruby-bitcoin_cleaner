module BitcoinTestnet
  class Executes

    def self.command(c)
      Dir.chdir BitcoinTestnet.dir
      prepared_command = PreparesCommand.for_silence(c)
      system prepared_command
    end

  end
end
