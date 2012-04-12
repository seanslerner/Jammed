require 'spec_helper'

module Jammed
  describe User do 
    let(:user) { Jammed::User.new('seanslerner') }
    describe "#initialize" do
      it "sets the username attribute" do
        user.username.should == "seanslerner"
      end
    end
    describe "#profile" do
      it "gets the data from the api" do
        user.profile["name"].should == "seanslerner"
      end

      it "parses the JSON return into a hash" do
        user.profile.should be_an_instance_of Hash
      end

      it "returns a 404 if unkown username used" do
        bad_user = Jammed::User.new('ThisUserNameShouldNeverExist')
        bad_user.profile.should == "404: User Not Found"
      end
    end

    describe "dynamic attribute" do
      it "returns the attribute value if present in profile" do
        user.name.should == "seanslerner"
      end

      it "raises method missing if attribute is not present" do
        lambda { user.foo_attribute }.should raise_error NoMethodError
      end
    end
  end
end