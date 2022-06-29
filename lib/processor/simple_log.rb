require_relative "../validator/ip_validator"
require_relative "../validator/path_validator"

module Processor
  class SimpleLog  
    def initialize
      @ip_validator = Validator::IpValidator
      @path_validator = Validator::PathValidator
    end

    def self.call(line , storage)
      new.call line, storage
    end

    def call(line, storage)
      path, ip = line.strip.split(" ")

      if ip_validator.valid?(ip) && path_validator.valid?(path)
        ip_hash = storage[path]

        if ip_hash 
          ip_hash[ip] = ip_hash[ip] ? ip_hash[ip] + 1 :   1
        else
          ip_hash = { ip => 1}
        end 
        
        storage[path] = ip_hash
      else
        wrong_data_str = ""
        wrong_data_str = "ip is wrong : #{ip}" unless ip_validator.valid?(ip)
        wrong_data_str = "#{wrong_data_str} ," if wrong_data_str.length > 0 && !path_validator.valid?(path)
        wrong_data_str = "#{wrong_data_str}path is wrong : #{path}" unless path_validator.valid?(path)
        p wrong_data_str
      end
    end

    private

    def ip_validator
      @ip_validator
    end

    def path_validator
      @path_validator
    end
  end
end
