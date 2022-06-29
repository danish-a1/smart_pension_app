module Counter
  class Most < Base
    private

    def count(ips_hash:)
      ips_hash.values.sum
    end
  end
end
