require 'spec_helper'

module Jammed
  describe Person do 

    before do
      serve_response("http://api.thisismyjam.com/1/IFTFOM.json?key=987bcab01b929eb2c07877b224215c92", :person)
    end

    describe ".profile" do
      
      it "gets the data from the api" do
        Jammed::Person.profile(:username => 'IFTFOM')["name"].should == "IFTFOM"
      end

      it "parses the JSON return into a hash" do
        Jammed::Person.profile(:username => 'IFTFOM').should be_an_instance_of Hash
      end
    end

    describe "dynamic attributes (.method_missing)" do
      
      it "returns the attribute value if present in profile" do
        Jammed::Person.name({:username => 'IFTFOM'}).should == "IFTFOM"
      end

      it "returns the attribute value if present in profile" do
        Jammed::Person.fullname({:username => 'IFTFOM'}).should match /Institute/
      end

      it "raises method missing if attribute is not present" do
        lambda { Jammed::Person.foo_attribute }.should raise_error NoMethodError
      end
    end
  end
end