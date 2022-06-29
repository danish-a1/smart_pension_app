module Validator
  class PathValidator
    PATH_REGEX = /\/\w+{1,255}/

    def self.valid?(path_string)
      new.valid?(path_string)
    end

    def valid?(path_string)
      !!(path_string =~PATH_REGEX)
    end
  end
end