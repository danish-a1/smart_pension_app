require_relative '../../../lib/writer/standard_output'

RSpec.describe Writer::StandardOutput do
  subject { described_class.call(storage: storage) }

    let(:storage) do
      [
        "first line",
        "second line",
        "third line",
      ]
    end

    describe "#call" do
      it "writes the storage to standard output" do
        expect { subject }.to output("\"first line\"\n\"second line\"\n\"third line\"\n").to_stdout
      end
    end
end