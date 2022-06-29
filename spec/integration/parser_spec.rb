require 'tempfile'
require_relative '../../lib/parser'
require_relative '../../lib/sorter/descending'
require_relative '../../lib/formatter/most'

RSpec.describe Parser do
  subject { described_class.run(input_path: input_path, mode: mode, sorter: Parser::SORTER.keys[0]) }

  let(:input_path) { tempfile.path }

  let(:tempfile) do
    Tempfile.new('webserver_log').tap do |file|
      lines.each do |line|
        file << line + "\n"
      end

      file.close
    end
  end

  let(:lines) do
    [
      '/help_page/1 192.131.31.215',
      '/help_page/1 192.131.31.215',
      '/help_page/1 192.131.31.216',
      '/help_page/1 192.131.31.215',
      '/home 192.131.31.215',
      '/home 192.131.31.216',
      '/home 192.131.31.217',
      '/contact 192.131.31.215',
      '/index 192.131.31.215',
    ]
  end

  describe 'run' do
    context 'Sort by most page count' do
      let(:mode) { Parser::MODES.keys[1] }

      it 'prints out sorted visits' do
        expect { subject }.to output("\"These are most visits\"\n\"/help_page/1 4 visits\"\n\"/home 3 visits\"\n\"/contact 1 visits\"\n\"/index 1 visits\"\n").to_stdout
      end
    end

    context 'Sort by most page count' do
      let(:mode) { Parser::MODES.keys[2] }
      it 'prints out sorted visits' do
        expect { subject }.to output("\"These are unique visits\"\n\"/home 3 unique visits\"\n\"/help_page/1 2 unique visits\"\n\"/contact 1 unique visits\"\n\"/index 1 unique visits\"\n").to_stdout
      end
    end
  end
end
