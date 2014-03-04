require "spec_helper"

module BitcoinTestnet
  describe VcrIntegrator do

    describe ".start" do
      it "sets the BitcoinTestnet.current_test to be the given test" do
        test = double(metadata: {})
        described_class.start(test)
        expect(BitcoinTestnet.current_test).to eq(test)
      end
    end

  end
end
