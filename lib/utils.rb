module EcoApps
  class Util
    class << self
      def encrypt(raw_data, salt = nil)
        require 'openssl' unless defined?(OpenSSL)
        OpenSSL::HMAC.hexdigest(OpenSSL::Digest::SHA1.new, salt || random_salt, raw_data.to_s)
      end

      def random_salt(size = 64)
        ActiveSupport::SecureRandom.hex(size)
      end

      def env_value(value)
        value.kind_of?(Hash) ? (value[Rails.env] || value) : value
      end

      def escape(url)
        URI.escape(url, Regexp.new("[^#{URI::PATTERN::UNRESERVED}]"))
      end
    end
  end
end
