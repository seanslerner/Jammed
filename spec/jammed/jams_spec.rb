require 'spec_helper'

module Jammed
  describe Jams do
    
    let(:api_key) {'987bcab01b929eb2c07877b224215c92'}

    describe ".jams" do
      before do
        serve_response("http://api.thisismyjam.com/1/IFTFOM/jams.json?key=987bcab01b929eb2c07877b224215c92", :jams)
      end
      
      it "gets jams from the api" do
        Jammed::Jams.jams('IFTFOM', api_key).should_not be(nil)
      end

      it "gets the current jam and past jams" do
        Jammed::Jams.jams('IFTFOM', api_key).to_s.should include("\"current\"=>false")
        Jammed::Jams.jams('IFTFOM', api_key).to_s.should include("\"current\"=>true")
      end
    end

    describe ".jams(:show => :past)" do
      before do
        serve_response("http://api.thisismyjam.com/1/IFTFOM/jams.json?key=987bcab01b929eb2c07877b224215c92&show=past", :jams_past)
      end
      
      it "gets past jams from the api" do
        Jammed::Jams.jams('IFTFOM', api_key, :show => :past).should_not be(nil)
        Jammed::Jams.jams('IFTFOM', api_key, :show => :past).to_s.should include("\"current\"=>false")
      end

      it "doesn't get the current jam" do
        Jammed::Jams.jams('IFTFOM', api_key, :show => :past).to_s.should_not include("\"current\"=>true")
      end
    end

    describe ".jams(:show => :current)" do
      before do
        serve_response("http://api.thisismyjam.com/1/IFTFOM/jams.json?key=987bcab01b929eb2c07877b224215c92", :jams)
      end
      
      it "gets the current jam from the api" do
        Jammed::Jams.jams('IFTFOM', api_key, :show => :current).should_not be(nil)
        Jammed::Jams.jams('IFTFOM', api_key, :show => :current).to_s.should include("\"current\"=>true")
      end

      it "doesn't get past jams" do
        Jammed::Jams.jams('IFTFOM', api_key, :show => :current).to_s.should_not include("\"current\"=>false")
      end
    end
  end
end
