require 'spec_helper'

module Jammed
  describe PopularJams do 

    let(:api_key) {'987bcab01b929eb2c07877b224215c92'}

    describe ".popular_jams" do
      
      before do
        serve_response("http://api.thisismyjam.com/1/popular.json?key=987bcab01b929eb2c07877b224215c92", :popular)
      end
      
      it "parses the JSON return into an array of Jams" do
        Jammed::PopularJams.popular_jams(api_key, false).should be_an_instance_of Array
      end

      it "gets popular jams from the api" do
        Jammed::PopularJams.popular_jams(api_key, false).should_not be_nil
      end
    end
  end
end