module EcoApps
  class Util
    class << self
      def encrypt(raw_data, salt = nil)
        require 'openssl' unless defined?(OpenSSL)
        OpenSSL::HMAC.hexdigest(OpenSSL::Digest::SHA1.new, salt || random_salt, raw_data.to_s)
      end

      def random_salt
        ActiveSupport::SecureRandom.hex(64)
      end

      def env_value(value)
        value.kind_of?(Hash) ? (value[Rails.env] || value) : value
      end
    end
  end
end
