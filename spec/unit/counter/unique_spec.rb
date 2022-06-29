require_relative '../../../lib/counter/base'
require_relative '../../../lib/counter/unique'

RSpec.describe Counter::Unique do
  subject { described_class.call(storage: storage) }

    let(:storage) do
      {
        a: {a: 1, b: 2, c: 3, d: 4},
        b: {e: 5, f: 6, g: 7},
        c: {h: 8, i: 9},
      }
    end

    describe "#call" do
      it "counts unique entries in each key" do
        expect(subject).to eq(
          a: 4,
          b: 3,
          c: 2,
        )
      end
    end
end