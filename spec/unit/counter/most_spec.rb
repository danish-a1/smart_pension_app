require_relative '../../../lib/counter/base'
require_relative '../../../lib/counter/most'

RSpec.describe Counter::Most do
  subject { described_class.call(storage: storage) }

    let(:storage) do
      {
        a: {a: 1, b: 2, c: 3, d: 4},
        b: {e: 5, f: 6, g: 7},
        c: {h: 8, i: 9},
      }
    end

    describe "#call" do
      it "counts total entries in each key" do
        expect(subject).to eq(
          a: 10,
          b: 18,
          c: 17,
        )
      end
    end
end