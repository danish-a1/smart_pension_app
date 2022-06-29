# frozen_string_literal: true

module Counter
  class Base
    def self.call(storage:)
      new.call(storage: storage)
    end

    def call(storage:)
      storage.map do |path, ips_hash|
        [path, count(ips_hash: ips_hash)]
      end.to_h
    end
  end
end
