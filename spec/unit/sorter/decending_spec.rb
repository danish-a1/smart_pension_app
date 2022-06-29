require_relative '../../../lib/sorter/descending'

RSpec.describe Sorter::Descending do
  subject { described_class.call(storage: storage) }

    let(:storage) do
      {
        a: 91,
        b: 27,
        c: 11,
      }
    end

    describe "#call" do
      it "sorts storage based on values (descending)" do
        expect(subject).to eq(
          a: 91,
          b: 27,
          c: 11,
        )
      end
    end
end