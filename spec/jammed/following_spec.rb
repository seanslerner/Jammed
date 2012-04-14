require 'spec_helper'

module Jammed
  describe Following do

    let(:followings) { Jammed::Following.new('seanslerner') }

    describe "#following" do 
      it "gets followings from the api" do
        followings.following.should_not be(nil)
      end
    end

    describe "#following(:order => :date)" do 
      it "can order followings by date" do
        followings.following(:order => :date)[-1]["name"].should == "TWHarr"
      end
    end

    describe "#following(:order => :likes)" do 
      it "can order followings by likes" do
        followings.following(:order => :likes).should_not be_nil
      end
    end

    describe "#following(:order => :alpha)" do
      it "can order followings by alpha" do
        followings.following(:order => :alpha)[-1]["name"].should == "TWHarr"
      end
    end 

    context "#following with bad :order value" do
      it "complains when non-existant :order value given" do
        message = "Cannot order Followings by bad"
        followings.following(:order => :bad).should == message
      end
    end
  end
end