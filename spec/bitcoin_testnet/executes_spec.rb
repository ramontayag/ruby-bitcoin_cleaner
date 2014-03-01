require "spec_helper"

module BitcoinTestnet
  describe Executes do

    describe ".command" do
      it "executes the prepared command in the BitcoinTestnet dir" do
        in_dir = double
        command = "do this"
        prepared_command = "do this prepared"

        allow(PreparesCommand).to receive(:for_silence).with(command).
          and_return(prepared_command)

        expect(Dir).to receive(:chdir).with(BitcoinTestnet.dir)
        expect(described_class).to receive(:system).with(prepared_command)

        described_class.command(command)
      end
    end

  end
end
