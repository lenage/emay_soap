# EmaySoap

Made easy to use Emay(http://www.emay.cn/) to send sms in Ruby.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'emay_soap'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install emay_soap

## Usage

#### Setup
```ruby
# Provide authentication credentials
EmaySoap.setup do |c|
  c.cdkey = 'yourcdkey'
  c.key = 'yourkeywant to use' # max length 15
  c.password = 'yourpassword'
end

client = EmaySoap.client
```

or

```ruby
# Provide authentication credentials
client = EmaySoap::Client.new(cdkey: 'yourcdkey, key: 'yoursessionkey', password: 'yourpassword')
```

#### Play with API

```ruby
# Emay requires you register your CD_KEY before send SMS
client.regist_ex

# List all APIs
client.operations

# Query Balance
client.get_balance

# Query each fee of SMS
client.get_balance

# Send SMS
client.send_sms

# change your session key
client.logout
client.key = 'yournewkey'
client.regist_ex
```

## Contributing

1. Fork it ( https://github.com/lenage/emay_soap/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
