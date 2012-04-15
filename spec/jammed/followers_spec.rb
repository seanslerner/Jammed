require 'spec_helper'

module Jammed
  describe Followers do 

    let(:followers) { Jammed::Followers.new('IFTFOM') }

    describe "#followers" do    
      before do
        serve_response("http://api.thisismyjam.com/1/IFTFOM/followers.json?key=987bcab01b929eb2c07877b224215c92", :followers)
      end
      
      it "gets followers from the api" do
        followers.followers.should_not be_nil
      end
    end

    describe "#followers(:order => :date)" do
      before do
        serve_response("http://api.thisismyjam.com/1/IFTFOM/followers.json?key=987bcab01b929eb2c07877b224215c92&order=when", :followers_when)
      end
      
      it "can order followers by date" do
        followers.followers(:order => :date).should_not be_nil
      end
    end

    describe "#followers(:order => :affinity)" do
      before do
        serve_response("http://api.thisismyjam.com/1/IFTFOM/followers.json?key=987bcab01b929eb2c07877b224215c92&order=affinity", :followers_affinity)
      end
      
      it "can order followers by likes" do
        followers.followers(:order => :affinity).should_not be_nil
      end
    end

    describe "#followers(:order => :alpha)" do
      before do
        serve_response("http://api.thisismyjam.com/1/IFTFOM/followers.json?key=987bcab01b929eb2c07877b224215c92&order=alpha", :followers_alpha)
      end
      
      it "can order followers by alpha" do
        followers.followers(:order => :alpha).should_not be_nil
      end
    end

    context "#followers with bad :order value" do
      it "complains when non-existant :order value given" do
        message = "Cannot order Followers by bad"
        followers.followers(:order => :bad).should == message
      end
    end
  end
end