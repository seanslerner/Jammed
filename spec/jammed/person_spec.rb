require 'spec_helper'

module Jammed
  describe Person do 

    let(:person) { Jammed::Person.new('IFTFOM') }

    describe "#initialize" do
      it "sets the username attribute" do
        person.username.should == "IFTFOM"
      end
    end

    describe "#profile" do
      
      before do
        serve_response("http://api.thisismyjam.com/1/IFTFOM.json?key=987bcab01b929eb2c07877b224215c92", :person)
      end
      
      it "gets the data from the api" do
        person.profile["name"].should == "IFTFOM"
      end

      it "parses the JSON return into a hash" do
        person.profile.should be_an_instance_of Hash
      end
    end

    describe "dynamic attribute" do
      
      before do
        serve_response("http://api.thisismyjam.com/1/IFTFOM.json?key=987bcab01b929eb2c07877b224215c92", :person)
      end
      
      it "returns the attribute value if present in profile" do
        person.name.should == "IFTFOM"
      end

      it "raises method missing if attribute is not present" do
        lambda { person.foo_attribute }.should raise_error NoMethodError
      end
    end
  end
end