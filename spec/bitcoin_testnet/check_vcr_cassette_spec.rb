require "spec_helper"

module BitcoinCleaner
  describe CheckVcrCassette, ".exists?" do

    subject { described_class.exists?(current_cassette) }

    context "there is a cassette" do
      let(:current_cassette) { double(file: file_path) }
      let(:file_path) { File.join(SPEC_DIR, "..", "tmp", "cassette.xml") }

      context "there is a file" do
        context "file exists in the disk" do
          before { FileUtils.touch(file_path) }
          it { is_expected.to be true }
        end

        context "file does not exist on the disk" do
          before { FileUtils.rm(file_path) }
          it { is_expected.to be false }
        end
      end

      context "there is no file" do
        let(:cassette_file) { nil }
        it { is_expected.to be false }
      end
    end

    context "there is no cassette" do
      let(:current_cassette) { nil }
      it { is_expected.to be false }
    end

  end
end
