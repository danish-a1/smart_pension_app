
module Reader
  class File
    attr_accessor :storage

    def initialize
      @storage = Hash.new { {} }
    end

    def self.call(input_path:, processor:)
      new.call input_path: input_path, processor: processor
    end

    def call(input_path:, processor:)
      raise "Couldn't find file in the given path: #{input_path}" unless ::File.exist?(input_path)

      read_file input_path: input_path, processor: processor
    end

    private
    def read_file(input_path:, processor:)
      ::File.foreach(input_path) do |line|
       processor.call line.strip, storage
      end

      storage
    end

  end
end  