module Formatter
  class Most < Base
    private

    def format(path:, view_count:)
      "#{path} #{view_count} visits"
    end
  end
end
