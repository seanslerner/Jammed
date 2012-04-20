require 'spec_helper'

module Jammed
  describe PeopleSearch do

    let(:api_key) {'987bcab01b929eb2c07877b224215c92'}

    describe ".search_name" do
      let(:query) {'institute'}
      let(:search) { Jammed::PeopleSearch.search_name(query, api_key) }
      before do 
        serve_response("http://api.thisismyjam.com/1/search/person.json?by=name&q=institute&key=987bcab01b929eb2c07877b224215c92", :search_name)
      end

      it "returns people from the API" do
        search.should_not be(nil)
      end

      it "returns people with the search string in their username, fullname, or Twitter name" do
        successful_search = false
        if search.first["fullname"].downcase.include?(query)
          successful_search = true
        elsif search.first["name"].downcase.include?(query)
          successful_search = true
        elsif search.first["twitterName"].downcase.include?(query)
          successful_search = true
        end
        successful_search.should be true
      end
    end

    describe ".search_artist" do
      let(:query) {'beach boys'}
      let(:search) { Jammed::PeopleSearch.search_artist(query, api_key) }

      before do 
        serve_response("http://api.thisismyjam.com/1/search/person.json?by=artist&q=beach+boys&key=987bcab01b929eb2c07877b224215c92", :search_artist)
      end

      it "returns people from the API" do
        search.should_not be(nil)
      end

      it "returns people who have posted tracks by the queried artist" do
        successful_search = false
        search.first["representativeArtists"].each do |artist|
          if artist.downcase.include?(query)
            successful_search = true
          end
          successful_search.should be true
        end
      end
    end

    describe ".search_track" do
      let(:query_artist) {'Lana del Rey'}
      let(:query_track) {'Video games'}
      let(:search) { Jammed::PeopleSearch.search_track(query_artist, query_track, api_key)}

      before do 
        serve_response("http://api.thisismyjam.com/1/search/person.json?by=track&q=Lana+del+Rey|Video+games&key=987bcab01b929eb2c07877b224215c92", :search_track)
      end

      it "returns people from the API" do
        search.should_not be(nil)
      end

      it "returns people who have posted a particluar track" do
        successful_search = false
        search.first["representativeArtists"].each do |artist|
          if artist.downcase.include?(query_artist.downcase)
            successful_search = true
          end
          successful_search.should be true
        end
      end
    end
  end
end