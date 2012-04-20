require 'spec_helper'

module Jammed
  describe Person do 

    let(:api_key) {'987bcab01b929eb2c07877b224215c92'}

    before do
      serve_response("http://api.thisismyjam.com/1/IFTFOM.json?key=987bcab01b929eb2c07877b224215c92", :person)
    end

    describe ".profile" do
      
      it "gets the data from the api" do
        Jammed::Person.profile('IFTFOM', api_key)["name"].should == "IFTFOM"
      end

      it "parses the JSON return into a hash" do
        Jammed::Person.profile('IFTFOM', api_key).should be_an_instance_of Hash
      end
    end

    describe "dynamic attributes (.method_missing)" do
      
      it "returns the attribute value if present in profile (name)" do
        Jammed::Person.name('IFTFOM', api_key).should == "IFTFOM"
      end

      it "returns the attribute value if present in profile" do
        Jammed::Person.fullname('IFTFOM', api_key).should match /Institute/
      end

      it "raises method missing if attribute is not present" do
        lambda { Jammed::Person.foo_attribute('IFTFOM', api_key) }.should raise_error NoMethodError
      end
    end
  end
end