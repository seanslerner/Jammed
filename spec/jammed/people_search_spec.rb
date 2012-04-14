require 'spec_helper'

module Jammed
  describe PeopleSearch do
    describe ".search_name" do
      
      before do 
        serve_response("http://api.thisismyjam.com/1/search/person.json?by=name&q=institute&key=987bcab01b929eb2c07877b224215c92", :search_name)
      end

      it "returns people from the API" do
        Jammed::PeopleSearch.search_name('institute').should_not be(nil)
      end
    end

    describe ".search_artist" do
      
      before do 
        serve_response("http://api.thisismyjam.com/1/search/person.json?by=artist&q=beach+boys&key=987bcab01b929eb2c07877b224215c92", :search_artist)
      end

      it "returns people from the API" do
        Jammed::PeopleSearch.search_artist('beach boys').should_not be(nil)
      end
    end

    describe ".search_track" do
      
      before do 
        serve_response("http://api.thisismyjam.com/1/search/person.json?by=track&q=Lana+del+Rey|Video+games&key=987bcab01b929eb2c07877b224215c92", :search_track)
      end

      it "returns people from the API" do
        Jammed::PeopleSearch.search_track('Lana del Rey', 'Video games').should_not be(nil)
      end
    end
  end
end