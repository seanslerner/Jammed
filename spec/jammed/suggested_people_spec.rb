require 'spec_helper'

module Jammed
  describe SuggestedPeople do
    describe ".people" do
      before do
        serve_response("http://api.thisismyjam.com/1/suggestedPeople.json?key=987bcab01b929eb2c07877b224215c92", :suggested_people)
      end
      
      it "returns people from the API" do
        Jammed::SuggestedPeople.people.should_not be_nil
      end
    end
  end
end