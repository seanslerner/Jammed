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
      it "parses the JSON return into a hash" do
        suggested_people.people.should be_an_instance_of Hash
      end
      
      it "gets the data from the api" do
        suggested_people.people["people"].should_not be_nil
      end
    end
  end
end