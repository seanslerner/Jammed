require 'spec_helper'

module Jammed
  describe Following do

    let(:followings) { Jammed::Following.new('seanslerner') }

    describe "#following" do 
      it "gets followings from the api" do
        followings.following.should_not be(nil)
      end
    end

    describe "#following_by_date" do 
      it "orders followings by date" do
        followings.following_by_date[-1]["name"].should == "TWHarr"
      end
    end

    describe "#following_by_likes" do 
      it "orders followings by likes" do
        pending "need to figure out what data to test"
      end
    end

    describe "#following_by_alpha" do
      it "orders followings by alpha" do
        followings.following_by_alpha[-1]["name"].should == "TWHarr"
      end
    end 
  end
end