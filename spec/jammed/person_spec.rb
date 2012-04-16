require 'spec_helper'

module Jammed
  describe Person do 

    describe ".profile" do
      
      before do
        serve_response("http://api.thisismyjam.com/1/IFTFOM.json?key=987bcab01b929eb2c07877b224215c92", :person)
      end
      
      it "gets the data from the api" do
        Jammed::Person.profile(:username => 'IFTFOM')["name"].should == "IFTFOM"
      end

      it "parses the JSON return into a hash" do
        Jammed::Person.profile(:username => 'IFTFOM').should be_an_instance_of Hash
      end
    end
  end
end