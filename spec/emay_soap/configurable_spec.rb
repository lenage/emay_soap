require 'spec_helper'

describe EmaySoap::Configurable do
  it '.setup_keys' do
    expect(EmaySoap::Configurable.setup_keys).to include(:cdkey)
  end

  it 'EmaySoap.setup' do
    EmaySoap.setup do |c|
      c.cdkey = 'cdkey'
      c.key = 'key'
      c.password = 'password'
    end
    expect(EmaySoap.options).to be_kind_of Hash
    expect(EmaySoap.options[:cdkey]).to eq 'cdkey'
  end
end
