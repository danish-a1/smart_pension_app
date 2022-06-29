require "tempfile"
require_relative '../../../lib/reader/file'
require_relative '../../../lib/processor/simple_log'

RSpec.describe Reader::File do
  subject { described_class.call(input_path: input_path, processor: Processor::SimpleLog) }

  let(:tempfile) do
    Tempfile.new("webserver_log").tap do |file|
      lines.each do |line|
        file << line + "\n"
      end

      file.close
    end
  end

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
  
  let(:storage) do 
      {"/contact" => {"8.8.8.8"=>1},"/help_page/1" => {"4.4.4.4"=>2, "8.8.8.8"=>2},"/home" => {"2.2.2.2"=>1, "4.4.4.4"=>1, "8.8.8.8"=>1},"/index" => {"2.2.2.2"=>1}}
  end

  describe "#call" do
    context "when file can be found" do
      let(:input_path) { tempfile.path }

      it "returns the hash contian path as keys and respective ip counter as values" do
        expect(subject).to eq(storage)
      end
    end

    context "when file can't be found" do
      let(:input_path) { "some/invalid/path" }

      it "raises an error" do
        expect { subject }.to raise_error("Couldn't find file in the given path: some/invalid/path")
      end
    end
  end
end
