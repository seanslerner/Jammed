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
      it "can use https" do
        HTTParty.should_receive(:get).
          with("https://api.thisismyjam.com/1/path", {:query=>nil, :body=>nil, :format=>:plain, :headers=>{"Accept"=>"application/json", "Content-Type"=>"application/json; charset=utf-8", "User-Agent"=>"Jammed/#{Jammed::VERSION}"}}).
          and_return(FakeResponse.new(200, 'this'))
        Jammed::API.request(:get, '/path', :https => true)
      end
    end
  end
end
