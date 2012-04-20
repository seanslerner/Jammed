require 'spec_helper'

module Jammed
  describe Likes do

    let(:api_key) {'987bcab01b929eb2c07877b224215c92'}

    describe ".likes" do
      before do
        serve_response("http://api.thisismyjam.com/1/IFTFOM/likes.json?key=987bcab01b929eb2c07877b224215c92", :likes)
      end
      
      it "gets likes from the api" do
        Jammed::Likes.likes('IFTFOM', api_key).should_not be(nil)
      end

      it "gets both current and past likes" do
        Jammed::Likes.likes('IFTFOM', api_key).to_s.should include("\"current\"=>false")
        Jammed::Likes.likes('IFTFOM', api_key).to_s.should include("\"current\"=>true")
      end
    end

    describe ".likes(:show => :current)" do
      before do
        serve_response("http://api.thisismyjam.com/1/IFTFOM/likes.json?show=current&key=987bcab01b929eb2c07877b224215c92", :likes_current)
      end
      
      it "gets current likes" do
        Jammed::Likes.likes('IFTFOM', api_key, :show => :current).to_s.should include("\"current\"=>true")
      end

      it "doesn't get past likes" do
        Jammed::Likes.likes('IFTFOM', api_key, :show => :current).to_s.should_not include("\"current\"=>false")
      end
    end

    describe ".likes(:show => :past)" do
      before do
        serve_response("http://api.thisismyjam.com/1/IFTFOM/likes.json?show=past&key=987bcab01b929eb2c07877b224215c92", :likes_past)
      end
      
      it "gets past likes" do
        Jammed::Likes.likes('IFTFOM', api_key, :show => :past).to_s.should include("\"current\"=>false")
      end

      it "doesn't get current likes" do
        Jammed::Likes.likes('IFTFOM', api_key, :show => :past).to_s.should_not include("\"current\"=>true")
      end
    end
  end
end