require_relative '../../../lib/validator/ip_validator'

RSpec.describe Validator::IpValidator do
  subject { described_class.valid?(ip_string) }

  let(:ip_string){ '172.016.008.001' }

  describe "#valid?" do
    it "correctly formats the storage" do
      expect(subject).to eq(true)
    end
  end
end