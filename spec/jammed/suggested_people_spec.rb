require 'spec_helper'

module Jammed
  describe SuggestedPeople do 

    let(:suggested_people) { Jammed::SuggestedPeople.new() }

    describe "#initialize" do
      it "initialises successfully" do
        suggested_people.should_not be_nil
      end
    end
    
    describe "#people" do
      
      before do
        serve_response("http://api.thisismyjam.com/1/suggestedPeople.json?key=987bcab01b929eb2c07877b224215c92", :suggested_people)
      end
      
      it "parses the JSON return into a hash" do
        suggested_people.people.should be_an_instance_of Hash
      end
      
      it "gets the data from the api" do
        suggested_people.people["people"].should_not be_nil
      end
    end
  end
end