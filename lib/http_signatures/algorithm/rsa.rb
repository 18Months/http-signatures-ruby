require "openssl"

module HttpSignatures
  module Algorithm
    class Rsa

      def initialize(digest_name)
        @digest_name = digest_name
        @digest = OpenSSL::Digest::SHA256.new
      end

      def name
        "rsa-#{@digest_name}"
      end

      def sign(key, data)
        OpenSSL::PKey::RSA.new(key).sign(@digest, data)
      end

    end
  end
end
