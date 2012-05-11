require 'spec_helper'

module Jammed
  describe RandomJam do 

    let(:api_key) {'987bcab01b929eb2c07877b224215c92'}

    describe ".jam" do
      
      before do
        serve_response("http://api.thisismyjam.com/1/random.json?key=987bcab01b929eb2c07877b224215c92", :random)
      end
      
      it "parses the JSON return into a hash" do
        Jammed::RandomJam.jam(api_key, false).should be_an_instance_of Hash
      end

      it "gets popular jams from the api" do
        Jammed::RandomJam.jam(api_key, false).should_not be_nil
      end
    end
  end
end