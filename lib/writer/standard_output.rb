module Writer
  class StandardOutput
    def self.call(storage:)
      new.call(storage: storage)
    end

    def call(storage:)
      storage.each do |visit|
        p visit
      end
    end
  end
end
