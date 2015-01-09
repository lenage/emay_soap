module EmaySoap
  module Configurable
    attr_accessor :prefix, :cdkey, :key, :password

    class << self
      def default_options
        {
          prefix: ENV['EMAY_PREFIX'],
          cdkey: ENV['EMAY_CDKEY'],
          key: ENV['EMAY_KEY'], # session key, max length is 15
          password: ENV['EMAY_PASSWORD']
        }
      end

      def setup_keys
        @setup_keys ||= [:prefix, :cdkey, :key, :password]
      end
    end

    def options
      ary = EmaySoap::Configurable.setup_keys.map do |key|
        [key, send(key)]
      end
      Hash[ary]
    end

    def setup
      yield self
    end
  end
end
