require 'spec_helper'

module Jammed
  describe Person do 

    let(:person) { Jammed::Person.new('seanslerner') }

    describe "#initialize" do
      it "sets the username attribute" do
        person.username.should == "seanslerner"
      end
    end

    describe "#profile" do
      it "gets the data from the api" do
        person.profile["name"].should == "seanslerner"
      end

      it "parses the JSON return into a hash" do
        person.profile.should be_an_instance_of Hash
      end

      it "returns a 404 if unkown username used" do
        bad_person = Jammed::Person.new('ThisUserNameShouldNeverExist')
        bad_person.profile.should == "404: User Not Found"
      end
    end

    describe "dynamic attribute" do
      it "returns the attribute value if present in profile" do
        person.name.should == "seanslerner"
      end

      it "raises method missing if attribute is not present" do
        lambda { person.foo_attribute }.should raise_error NoMethodError
      end
    end
  end
end