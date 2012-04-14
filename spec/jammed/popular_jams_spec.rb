require 'spec_helper'

module Jammed
  describe PopularJams do 

    let(:pop_jams) { Jammed::PopularJams.new }
    describe "#popular_jams" do
      
      before do
        serve_response("http://api.thisismyjam.com/1/popular.json?key=987bcab01b929eb2c07877b224215c92", :popular)
      end
      
      it "parses the JSON return into a hash" do
        pop_jams.popular_jams.should be_an_instance_of Hash
      end

      it "gets popular jams from the api" do
        pop_jams.popular_jams["jams"].should_not be_nil
      end
    end
  end
end