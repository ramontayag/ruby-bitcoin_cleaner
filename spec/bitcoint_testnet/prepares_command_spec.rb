require "spec_helper"

module BitcoinTestnet
  describe PreparesCommand do

    describe ".for_silence" do
      it "redirects stdout and stderr to /dev/null" do
        expect(described_class.for_silence("some command")).
          to eq("some command > /dev/null 2>&1")
      end
    end

  end
end
