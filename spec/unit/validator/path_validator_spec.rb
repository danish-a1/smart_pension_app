require_relative '../../../lib/validator/path_validator'

RSpec.describe Validator::PathValidator do
  subject { described_class.valid?(path_string) }

  let(:path_string){ '/help_page' }

  describe "#valid?" do
    it "correctly formats the storage" do
      expect(subject).to eq(true)
    end
  end
end