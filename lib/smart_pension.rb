class SmartPension
  attr_reader :input_path, :input_reader, :processor, :sorter, :writer,  :counter, :formatter

  def initialize(input_path: nil, input_reader: nil, processor: nil, counter: nil, sorter: nil, formatter: nil, writer: nil)
    @input_path = input_path || raise("Path to input not provided!")
    @input_reader = input_reader || Reader::File
    @processor = processor || Processor::SimpleLog
    @counter = counter
    @sorter = sorter || Sorter::Descending
    @formatter = formatter
    @writer = writer || Writer::StandardOutput
  end

  def call
    if counter && formatter
      exec
    else
      @counter = Counter::Most
      @formatter = Formatter::Most
      exec
      @counter = Counter::Unique
      @formatter = Formatter::Unique
      exec
    end
  end

  private

  def exec
    print_statment
    read
      .then { |storage| count(storage: storage) }
      .then { |storage| sort(storage: storage) }
      .then { |storage| format(storage: storage) }
      .then { |storage| write(storage: storage) }
  end

  def read
    input_reader.call(input_path: input_path, processor: processor)
  end
  
  def count(storage:)
    counter.call(storage: storage)
  end

  def sort(storage:)
    sorter.call(storage: storage)
  end

  def format(storage:)
    formatter.call(storage: storage)
  end

  def write(storage:)
    writer.call(storage: storage)
  end

  def print_statment
    p "These are #{formatter.to_s.split('::').last.downcase} visits"
  end
end
