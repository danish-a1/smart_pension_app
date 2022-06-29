require_relative "smart_pension"
require_relative "reader/file"
require_relative "processor/simple_log"
require_relative "counter/base"
require_relative "counter/most"
require_relative "counter/unique"
require_relative "sorter/descending"
require_relative "sorter/aescending"
require_relative "formatter/base"
require_relative "formatter/most"
require_relative "formatter/unique"
require_relative "writer/standard_output"

class Parser
  MODES = {
    all: {
      counter: nil,
      formatter: nil,
    },
    most: {
      counter: Counter::Most,
      formatter: Formatter::Most,
    },
    unique: {
      counter: Counter::Unique,
      formatter: Formatter::Unique,
    },
  }.freeze

  SORTER = {
    descending: {
      sorter: Sorter::Descending,
    },
    aescending: {
      sorter: Sorter::Aescending,
    },
  }.freeze

  def self.run(input_path:, mode:, sorter:)
    mode_settings = MODES[mode]
    sort_settings = SORTER[sorter]

    SmartPension.new(
      input_path: input_path,
      counter: mode_settings[:counter],
      formatter: mode_settings[:formatter],
      sorter: sort_settings[:sorter],
    ).call
  end
end
