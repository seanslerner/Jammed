require 'spec_helper'

module Jammed
  describe User do
    let(:user) { Jammed::User.new('IFTFOM') }

    describe "#initialize" do
      it "sets the username" do
        user.username.should == 'IFTFOM'
      end
    end

    describe "#profile" do
      before do
        serve_response("http://api.thisismyjam.com/1/IFTFOM.json?key=987bcab01b929eb2c07877b224215c92", :person)
      end

      it "calls Jammed::Person.profile" do
        Jammed::Person.should_receive(:profile)
        user.profile
      end

      it "saves API data in @profile" do
        user.profile.should be_an_instance_of Hash
      end 

      it "return @profile if set" do
        cached = user.profile
        cached.should equal(user.profile)
      end
    end

    describe "#profile!" do 
      before do
        serve_response("http://api.thisismyjam.com/1/IFTFOM.json?key=987bcab01b929eb2c07877b224215c92", :person)
      end
      it "calls Jammed::Person.profile" do
        Jammed::Person.should_receive(:profile)
        user.profile!
      end

      it "reassigns @profile" do
        cached = user.profile
        cached.should_not equal(user.profile!)
      end
    end

    describe "dynamic attribute" do

      before do
        serve_response("http://api.thisismyjam.com/1/IFTFOM.json?key=987bcab01b929eb2c07877b224215c92", :person)
      end
      
      it "returns the attribute value if present in profile" do
        user.name.should == "IFTFOM"
      end

      it "raises method missing if attribute is not present" do
        lambda { user.foo_attribute }.should raise_error NoMethodError
      end
    end
  end
end
