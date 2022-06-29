module Counter
  class Unique < Base
    private

    def count(ips_hash:)
      ips_hash.keys.size
    end
  end
end
