require 'spec_helper'

module Jammed
  describe Base do 

    let(:api_key) {'987bcab01b929eb2c07877b224215c92'}
    let(:jammed) {Jammed::Base.new(api_key)}
    let(:user) {'IFTFOM'}

    describe "#initialize" do
      it "sets @https" do
        jam = Jammed::Base.new(api_key, :https => true)
        jam.https.should be true
      end

      it "defaults @https to false" do
        jammed.https.should be false
      end
    end

    describe "#followers" do 
      it "calls Jammed::Followers.followers" do
        Jammed::Followers.should_receive(:followers)
        jammed.followers(user)
      end

      it "merges @https into opts" do
        Jammed::Followers.should_receive(:followers).with(user, api_key, {:https => false})
        jammed.followers(user)
      end
    end

    describe "#following" do 
      it "calls Jammed::Following.following" do
        Jammed::Following.should_receive(:following)
        jammed.following(user)
      end
    end

    describe "#jams" do 
      it "calls Jammed::Jams.jams" do
        Jammed::Jams.should_receive(:jams)
        jammed.jams(user)
      end
    end

    describe "#likes" do 
      it "calls Jammed::Like.likes" do
        Jammed::Likes.should_receive(:likes)
        jammed.likes(user)
      end
    end

    describe "#popular_jams" do 
      it "calls Jammed::PopularJams.popular_jams" do
        Jammed::PopularJams.should_receive(:popular_jams)
        jammed.popular_jams
      end
    end

    describe "#profile" do 
      it "calls Jammed::Person.profile" do
        Jammed::Person.should_receive(:profile)
        jammed.profile(user)
      end
    end

    describe "#random" do 
      it "calls Jammed::RandomJam.jam" do
        Jammed::RandomJam.should_receive(:jam)
        jammed.random
      end
    end

    describe "#search_name" do 
      it "calls Jammed::PeopleSearch.search_name" do
        Jammed::PeopleSearch.should_receive(:search_name)
        jammed.search_name(user)
      end
    end

    describe "#search_artist" do 
      it "calls Jammed::PeopleSearch.search_artist" do
        Jammed::PeopleSearch.should_receive(:search_artist)
        jammed.search_artist('track')
      end
    end

    describe "#search_track" do 
      it "calls Jammed::PeopleSearch.search_track" do
        Jammed::PeopleSearch.should_receive(:search_track)
        jammed.search_track('artist', 'track')
      end
    end

    describe "#suggested_people" do 
      it "calls Jammed::SuggestedPeople.people" do
        Jammed::SuggestedPeople.should_receive(:people)
        jammed.suggested_people
      end
    end

    describe "#user" do 
      it "calls Jammed::User.new" do
        Jammed::User.should_receive(:new).with(user, api_key)
        jammed.user(user)
      end
    end
  end
end