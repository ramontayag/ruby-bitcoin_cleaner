require "spec_helper"

module BitcoinCleaner
  describe VcrIntegrator do

    describe ".start" do
      it "sets the BitcoinCleaner.current_test to be the given test" do
        test = double(metadata: {})
        described_class.start(test)
        expect(BitcoinCleaner.current_test).to eq(test)
      end
    end

  end
end
