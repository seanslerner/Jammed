require 'spec_helper'

module Jammed
  describe User do
    let(:api_key) {'987bcab01b929eb2c07877b224215c92'}
    let(:user) { Jammed::User.new('IFTFOM', api_key) }

    describe "#initialize" do
      it "sets the username" do
        user.username.should == 'IFTFOM'
      end
    end

    context "Followers" do 
      before do
        serve_response("http://api.thisismyjam.com/1/IFTFOM/followers.json?key=987bcab01b929eb2c07877b224215c92", :followers)
      end

      describe "#followers" do
        it "calls Jammed::Followers.followers" do
          Jammed::Followers.should_receive(:followers)
          user.followers
        end
        it "sends @username + :order options to Jammed::Followers" do
          Jammed::Followers.should_receive(:followers).with('IFTFOM', api_key, {:order => :date})
          user.followers(:order => :date)
        end
        it "saves followers in @followers" do
          user.followers.should be_an_instance_of Array
        end
        it "returns @followers if set" do
          cached = user.followers
          cached.should equal(user.followers)
        end
      end

      describe "#followers!" do
        it "calls Jammed::Followers.follower" do
          Jammed::Followers.should_receive(:followers)
          user.followers!
        end
        it "reassigns @followers" do
          cached = user.followers
          cached.should_not equal(user.followers!)
        end
      end
    end

    context "Followings" do
      before do
        serve_response("http://api.thisismyjam.com/1/IFTFOM/following.json?key=987bcab01b929eb2c07877b224215c92", :following)
      end
      describe "#following" do
        it "calls Jammed::Following.following" do
          Jammed::Following.should_receive(:following)
          user.following
        end
        it "sends @username + :order options to Jammed::Following" do
          Jammed::Following.should_receive(:following).with('IFTFOM', api_key, {:order => :date})
          user.following(:order => :date)
        end
        it "saves followers in @following" do
          user.following.should be_an_instance_of Array
        end
        it "returns @following if set" do
          cached = user.following
          cached.should equal(user.following)
        end
      end
      describe "#following!" do
        it "calls Jammed::Following.following" do
          Jammed::Following.should_receive(:following)
          user.following
        end
        it "reassigns @following" do
          cached = user.following
          cached.should_not equal(user.following!)
        end
      end
    end

    context "Jams" do
      before do
        serve_response("http://api.thisismyjam.com/1/IFTFOM/jams.json?key=987bcab01b929eb2c07877b224215c92", :jams)
      end
      describe "#jams" do
        it "calls Jammed::Jams.jams" do
          Jammed::Jams.should_receive(:jams)
          user.jams
        end
        it "sends @username + :show options to Jammed::Jams" do
          Jammed::Jams.should_receive(:jams).with('IFTFOM', api_key, {:show => :past})
          user.jams(:show => :past)
        end
        it "saves jams in @jams" do
          user.jams.should be_an_instance_of Array
        end
        it "returns @jams if set" do
          cached = user.jams
          cached.should equal(user.jams)
        end
      end
      describe "#jams!" do
        it "calls Jammed::Jams.jams" do
          Jammed::Jams.should_receive(:jams)
          user.jams
        end
        it "reassigns @jams" do
          cached = user.jams
          cached.should_not equal(user.jams!)
        end
      end
    end

    context "Likes" do
      before do
        serve_response("http://api.thisismyjam.com/1/IFTFOM/likes.json?key=987bcab01b929eb2c07877b224215c92", :likes)
      end
      describe "#likes" do
        it "calls Jammed::Likes.likes" do
          Jammed::Likes.should_receive(:likes)
          user.likes
        end
        it "sends @username + :show options to Jammed::Likes" do
          Jammed::Likes.should_receive(:likes).with('IFTFOM', api_key, {:show => :past})
          user.likes(:show => :past)
        end
        it "saves likes in @likes" do
          user.likes.should be_an_instance_of Array
        end
        it "returns @likes if set" do
          cached = user.likes
          cached.should equal(user.likes)
        end
      end
      describe "#likes!" do
        it "calls Jammed::Likes.likes" do
          Jammed::Likes.should_receive(:likes)
          user.likes
        end
        it "reassigns @likes" do
          cached = user.likes
          cached.should_not equal(user.likes!)
        end
      end
    end

    context "Profile + Profile Attributes" do
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

        it "returns @profile if set" do
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

      describe "dynamic attributes (#method_missing)" do
        before do
          serve_response("http://api.thisismyjam.com/1/IFTFOM.json?key=987bcab01b929eb2c07877b224215c92", :person)
        end
        
        it "returns the attribute value if present in profile" do
          user.name.should == "IFTFOM"
        end

        it "raises method missing if attribute is not present" do
          lambda { user.foo_attribute }.should raise_error NameError
        end
      end

      describe "#js_namify" do 
        it "turns a snake_case string into a javaScriptStyled string" do
          user.js_namify('joined_date').should == 'joinedDate'
        end
      end
    end
  end
end
