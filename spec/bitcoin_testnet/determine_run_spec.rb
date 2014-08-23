require "spec_helper"

module BitcoinCleaner
  describe DetermineRun, ".execute" do

    let(:rspec_example) do
      double(
        metadata: {
          vcr: vcr_metadata,
          bitcoin_cleaner: bitcoin_cleaner_metadata,
        }
      )
    end

    let(:current_cassette) { double }
    let(:vcr_metadata) { nil }

    subject { described_class.execute(rspec_example) }

    before do
      allow(VCR).to receive(:current_cassette).and_return(current_cassette)
    end

    context "bitcoin_cleaner is false" do
      let(:bitcoin_cleaner_metadata) { false }

      it { is_expected.to be false }
    end

    context "bitcoin_cleaner is true" do
      let(:bitcoin_cleaner_metadata) { true }
      context "vcr metadata is true and cassette exists" do
        let(:vcr_metadata) { true }

        before do
          allow(CheckVcrCassette).to receive(:exists?).with(current_cassette).
            and_return(true)
        end

        it { is_expected.to be true }
      end

      context "vcr metadata is true and cassette does not exist" do
        let(:vcr_metadata) { true }

        before do
          allow(CheckVcrCassette).to receive(:exists?).with(current_cassette).
            and_return(false)
        end

        it { is_expected.to be true }
      end

      context "vcr metadata is set to record all and cassette exists" do
        let(:vcr_metadata) { {record: :all} }
        before do
          allow(CheckVcrCassette).to receive(:exists?).with(current_cassette).
            and_return(true)
        end

        it { is_expected.to be true }
      end

      context "vcr metadata is set to record all and cassette does not exist" do
        let(:vcr_metadata) { {record: :all} }
        before do
          allow(CheckVcrCassette).to receive(:exists?).with(current_cassette).
            and_return(false)
        end

        it { is_expected.to be true }
      end

      context "vcr metadata is set to record once and cassette exists" do
        let(:vcr_metadata) { {record: :once} }
        before do
          allow(CheckVcrCassette).to receive(:exists?).with(current_cassette).
            and_return(true)
        end

        it { is_expected.to be false }
      end

      context "vcr metadata is set to record once and cassette does not exist" do
        let(:vcr_metadata) { {record: :once} }
        before do
          allow(CheckVcrCassette).to receive(:exists?).with(current_cassette).
            and_return(false)
        end

        it { is_expected.to be true }
      end

      context "vcr metadata is not set" do
        let(:vcr_metadata) { nil }
        it { is_expected.to be true }
      end
    end

  end
end
