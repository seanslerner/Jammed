require 'spec_helper'

module Jammed
  describe Following do

    let(:followings) { Jammed::Following.new('IFTFOM') }

    describe "#following" do
      before do
        serve_response("http://api.thisismyjam.com/1/IFTFOM/following.json?key=987bcab01b929eb2c07877b224215c92", :following)
      end
      
      it "gets followings from the api" do
        followings.following.should_not be(nil)
      end
    end

    describe "#following(:order => :date)" do
      before do
        serve_response("http://api.thisismyjam.com/1/IFTFOM/following.json?key=987bcab01b929eb2c07877b224215c92&order=when", :following_when)
      end
      
      it "can order followings by date" do
        followings.following(:order => :date)[-1]["name"].should == "kateconlow"
      end
    end

    describe "#following(:order => :affinity)" do 
      before do
        serve_response("http://api.thisismyjam.com/1/IFTFOM/following.json?key=987bcab01b929eb2c07877b224215c92&order=affinity", :following_affinity)
      end
      
      it "can order followings by likes" do
        followings.following(:order => :affinity).should_not be_nil
      end
    end

    describe "#following(:order => :alpha)" do
      before do
        serve_response("http://api.thisismyjam.com/1/IFTFOM/following.json?key=987bcab01b929eb2c07877b224215c92&order=alpha", :following_alpha)
      end
      
      it "can order followings by alpha" do
        followings.following(:order => :alpha)[-1]["name"].should == "AlexEvans"
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