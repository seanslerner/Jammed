require 'spec_helper'

module Jammed
  describe Jams do
    let(:jam) { Jammed::Jams.new('IFTFOM') }

    describe "#jams" do
      before do
        serve_response("http://api.thisismyjam.com/1/IFTFOM/jams.json?key=987bcab01b929eb2c07877b224215c92", :jams)
      end
      
      it "gets jams from the api" do
        jam.jams.should_not be(nil)
      end

      it "gets the current jam and past jams" do
        jam.jams.to_s.should include("\"current\"=>false")
        jam.jams.to_s.should include("\"current\"=>true")
      end
    end

    describe "#past_jams" do
      before do
        serve_response("http://api.thisismyjam.com/1/IFTFOM/jams.json?key=987bcab01b929eb2c07877b224215c92&show=past", :jams_past)
      end
      
      it "gets past jams from the api" do
        jam.past_jams.should_not be(nil)
        jam.past_jams.to_s.should include("\"current\"=>false")
      end

      it "doesn't get the current jam" do
        jam.past_jams.to_s.should_not include("\"current\"=>true")
      end
    end

    describe "#current_jam" do
      before do
        serve_response("http://api.thisismyjam.com/1/IFTFOM/jams.json?key=987bcab01b929eb2c07877b224215c92", :jams)
      end
      
      it "gets the current jam from the api" do
        jam.current_jam.should_not be(nil)
        jam.current_jam.to_s.should include("\"current\"=>true")
      end

      it "doesn't get past jams" do
        jam.current_jam.to_s.should_not include("\"current\"=>false")
      end
    end
  end
end