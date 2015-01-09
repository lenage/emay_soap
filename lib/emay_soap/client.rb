require "savon"
require "emay_soap/configurable"

module EmaySoap
  class Client
    include EmaySoap::Configurable

    ENDPOINT = 'http://sdk4report.eucp.b2m.cn:8080/sdk/SDKService?wsdl'.freeze

    def initialize(options = {})
      EmaySoap::Configurable.setup_keys.each do |k|
        instance_variable_set(:"@#{k}", options[k] || EmaySoap::Configurable.default_options[k])
      end
    end

    def operations
      savon.operations
    end

    def operation(action)
      savon.operation(action)
    end

    # register cdkey
    def regist_ex
      call(:regist_ex, arg2: @password)
    end

    def regist_detail_info(options)
      raise 'Detail info required' if options.blank?
      msg = { arg1: options[:e_name], arg2: options[:link_man],
              arg4: options[:phone_num], arg5: options[:mobile],
              arg6: options[:email], arg7: options[:fax],
              arg8: options[:address], arg9: options[:postcode] }
      call(:regist_detail_info, msg)
    end

    def charge_up(cardno, cardpass)
      call(:charge_up, arg2: cardno, arg3: cardpass)
    end

    # send SMS out
    # @params mobiles [String/Array] List of mobiles which send sms, max to 200
    #         content [String], content of sms
    #         options [Hash]
    #                 :send_at [Time] set a time to send sms, send immediately if nil
    #                 :kind  [String] custom SMS content kind
    #                 :priority [Integer] SMS priority, from 1 to 5
    #                 :id SMS ID, [Integer] you can set a SMS ID for your content
    def send_sms(mobiles, content, options = {})
      send_at = format_sent_at(options[:send_at]) unless options[:send_at].blank?
      mobiles = mobiles.is_a?(String) ? [mobiles] : mobiles
      content = "#{prefix} #{content}" unless prefix.nil?
      msg = { arg2: send_at, arg3: mobiles, arg4: content, arg5: options[:kind], arg6: nil, arg7: options[:priority], arg8: options[:id] }
      call(:send_sms, msg)
    end

    def serial_pwd_upd(new_password)
      call(:serial_pwd_upd, arg2: @password, arg3: new_password)
    end

    # Create all methods via method_missing,
    def method_missing(method, *args)
      ary = args.each_with_index.inject([]) do |r, (e, i)|
        r << ["arg#{i+2}".to_sym, e]
      end
      message = Hash[ary]
      if operations.include?(method)
        call(method, message)
      else
        super
      end
    end

    private

    def savon
      @client ||= Savon.client(wsdl: ENDPOINT)
    end

    def call(action, message)
      msg = { arg0: @cdkey, arg1: @key }.merge message
      savon.call(action, message: msg).body
    end

    def format_sent_at send_at
      send_at.strftime('%Y%m%d%H%M%S')
    end
  end
end
