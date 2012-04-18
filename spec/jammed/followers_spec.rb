require 'spec_helper'

module Jammed
  describe Followers do 

    describe ".followers" do    
      before do
        serve_response("http://api.thisismyjam.com/1/IFTFOM/followers.json?key=987bcab01b929eb2c07877b224215c92", :followers)
      end
      
      it "gets followers from the api" do
        Jammed::Followers.followers('IFTFOM').should_not be_nil
      end
    end

    describe ".followers(:order => :date)" do
      before do
        serve_response("http://api.thisismyjam.com/1/IFTFOM/followers.json?key=987bcab01b929eb2c07877b224215c92&order=followedDate", :followers_date)
      end
      
      it "can order followers by date" do
        Jammed::Followers.followers('IFTFOM', :order => :date).should_not be_nil
      end
    end

    describe ".followers(:order => :affinity)" do
      before do
        serve_response("http://api.thisismyjam.com/1/IFTFOM/followers.json?key=987bcab01b929eb2c07877b224215c92&order=affinity", :followers_affinity)
      end
      
      it "can order followers by likes" do
        Jammed::Followers.followers('IFTFOM', :order => :affinity).should_not be_nil
      end
    end

    describe ".followers(:order => :name)" do
      before do
        serve_response("http://api.thisismyjam.com/1/IFTFOM/followers.json?key=987bcab01b929eb2c07877b224215c92&order=name", :followers_name)
      end
      
      it "can order followers by name" do
        Jammed::Followers.followers('IFTFOM', :order => :name).should_not be_nil
      end
    end

    context ".followers with bad :order value" do
      it "complains when non-existant :order value given" do
        message = "Cannot order Followers by bad"
        Jammed::Followers.followers('IFTFOM', :order => :bad).should == message
      end
    end
  end
end