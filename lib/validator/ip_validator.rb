module Validator
  class IpValidator
    IP_REGEX = /^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}$/
    #IP_REGEX = /^((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$/
    
    def self.valid?(ip_string)
      new.valid?(ip_string)
    end

    def valid?(ip_string)
      !!(ip_string =~IP_REGEX)
    end
  end
end
