require "spec_helper"

module BitcoinCleaner
  describe Executor, ".execute" do

    it "executes the given commands piping stderr and sdout each to /dev/null" do
      commands = [
        "command 1",
        "comm2"
      ]

    end

  end
end
