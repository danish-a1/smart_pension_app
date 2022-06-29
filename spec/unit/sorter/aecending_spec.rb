require_relative '../../../lib/sorter/aescending'

RSpec.describe Sorter::Aescending do
  subject { described_class.call(storage: storage) }

    let(:storage) do
      {
        a: 27,
        b: 11,
        c: 91,
      }
    end

    describe "#call" do
      it "sorts storage based on values (aescending)" do
        expect(subject).to eq(
          b: 11,
          a: 27,
          c: 91,
        )
      end
    end
end