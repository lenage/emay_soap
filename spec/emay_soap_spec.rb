require 'spec_helper'

describe EmaySoap do
  context '.client' do

    before(:all) do
      EmaySoap.setup do |c|
        c.cdkey = 'some-cd-key'
        c.key = 'hello'
        c.password = 'world'
      end
    end

    it 'create an EmaySoap::Client' do
      expect(EmaySoap.client).to be_kind_of EmaySoap::Client
    end
  end
end
