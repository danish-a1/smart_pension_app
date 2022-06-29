require_relative '../../../lib/processor/simple_log'

RSpec.describe Processor::SimpleLog do
  storage = Hash.new( {} )
  subject { lines.each { |line| described_class.call(line, storage) } }

  let(:lines) do
    [
      "/help_page/1 8.8.8.8",
      "/help_page/1 8.8.8.8",
      "/help_page/1 4.4.4.4",
      "/help_page/1 4.4.4.4",
      "/home 8.8.8.8",
      "/home 4.4.4.4",
      "/home 2.2.2.2",
      "/contact 8.8.8.8",
      "/index 2.2.2.2",
    ]
  end

  describe "#call" do
    it "returns an lines because we are calling it as each line" do
      expect(subject).to eq(lines)
    end
  end
end