require 'spec_helper'

class FakeResponse
  attr_accessor :code, :body
  def initialize code, body
    @code, @body = code, body
  end
end

module Jammed
  describe API do 
    describe "#request" do 
      it "sends a request to HTTParty" do
        HTTParty.should_receive(:get).and_return(FakeResponse.new(200, 'this'))
        Jammed::API.request(:get, '/path')
      end
    end
  end
end
