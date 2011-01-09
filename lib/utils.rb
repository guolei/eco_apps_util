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
  
  class Const
    class << self
      def security_token
        "a2f88d5008d3364b1c31fe42d4d6472084d679afdbb4a37ba3aeeaf4386944c80989eeb892aa8e3bde6e357214938ce02eb9e2786333e13450ddc29cb1e81770"
      end
    end
  end
end
