require_relative '../../../lib/formatter/base'
require_relative '../../../lib/formatter/most'

RSpec.describe Formatter::Most do
  subject { described_class.call(storage: storage) }

    let(:storage) do
      {
        "/path/2" => 11,
        "/path/1" => 27,
        "/path/3" => 91,
      }
    end

    describe "#call" do
      it "correctly formats the storage" do
        expect(subject).to eq(
          [
            "/path/2 11 visits",
            "/path/1 27 visits",
            "/path/3 91 visits",
          ],
        )
      end
    end
end
