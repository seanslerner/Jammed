require 'spec_helper'

module Jammed
  describe Following do

    let(:api_key) {'987bcab01b929eb2c07877b224215c92'}

    describe ".following" do
      before do
        serve_response("http://api.thisismyjam.com/1/IFTFOM/following.json?key=987bcab01b929eb2c07877b224215c92", :following)
      end
      
      it "gets followings from the api" do
        Jammed::Following.following('IFTFOM', api_key).should_not be(nil)
      end
    end

    describe ".following(:order => :date)" do
      before do
        serve_response("http://api.thisismyjam.com/1/IFTFOM/following.json?key=987bcab01b929eb2c07877b224215c92&order=followedDate", :following_date)
      end
      
      it "can order followings by date" do
        Jammed::Following.following('IFTFOM', api_key, :order => :date).should_not be_nil
      end
    end

    describe ".following(:order => :affinity)" do 
      before do
        serve_response("http://api.thisismyjam.com/1/IFTFOM/following.json?key=987bcab01b929eb2c07877b224215c92&order=affinity", :following_affinity)
      end
      
      it "can order followings by likes" do
        Jammed::Following.following('IFTFOM', api_key, :order => :affinity).should_not be_nil
      end
    end

    describe ".following(:order => :name)" do
      before do
        serve_response("http://api.thisismyjam.com/1/IFTFOM/following.json?key=987bcab01b929eb2c07877b224215c92&order=name", :following_name)
      end
      
      it "can order followings by name" do
        Jammed::Following.following('IFTFOM', api_key, :order => :name).should_not be_nil
      end
    end 

    context ".following with bad :order value" do
      it "complains when non-existant :order value given" do
        message = "Cannot order Followings by bad"
        Jammed::Following.following('IFTFOM', api_key, :order => :bad).should == message
      end
    end
  end
end