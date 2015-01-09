require "emay_soap/version"
require "emay_soap/client"
require "emay_soap/configurable"

module EmaySoap
  class << self
    include EmaySoap::Configurable

    def client
      @client = EmaySoap::Client.new(options)
      @client
    end
  end
end
