require 'spec_helper'

describe EmaySoap::Client do
  it '#operations' do
    expect(EmaySoap::Client.new.operations).to be_kind_of Array
  end

  it '#operation' do
    expect(EmaySoap::Client.new.operation(:get_balance)).to be_kind_of Savon::Operation
  end

  it 'method_missing' do
    client = EmaySoap.client
    expect(client.get_balance).to be_kind_of Hash
    expect(client.get_balance[:get_balance_response]).to be_truthy
  end
end
