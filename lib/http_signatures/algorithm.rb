module HttpSignatures
  module Algorithm

    def self.create(name)
      case name.downcase
      when "hmac-sha1" then Hmac.new("sha1")
      when "hmac-sha256" then Hmac.new("sha256")
      when "rsa-sha256" then Rsa.new("sha256")
      when "rsa_sha256" then Rsa.new("sha256")
      else raise UnknownAlgorithm.new(name)
      end
    end

    class UnknownAlgorithm < StandardError
      def initialize(name)
        super("Unknown algorithm name '#{name}'")
      end
    end

  end
end
