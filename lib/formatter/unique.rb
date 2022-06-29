module Formatter
  class Unique < Base
    private

    def format(path:, view_count:)
      "#{path} #{view_count} unique visits"
    end
  end
end
