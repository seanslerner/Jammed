require 'uri'

module Jammed

  class Search
    include HTTParty
    base_uri 'http://api.thisismyjam.com/1'
  end

  class PeopleSearch

    def self.search_name(name)
      search = Search.get "/search/person.json?by=name&q=#{name.split.join('+')}&key=#{API_KEY}"
      search["people"][0] ? search["people"] : "No people found"
    end

    def self.search_artist(artist)
      search = Search.get "/search/person.json?by=artist&q=#{artist.split.join('+')}&key=#{API_KEY}"
      search["people"][0] ? search["people"] : "No artists found"
    end

    def self.search_track(artist, track)
      uri = URI.escape("/search/person.json?by=track&q=#{artist.split.join('+')}|#{track.split.join('+')}&key=#{API_KEY}", '|')
      search = Search.get uri   
      search["people"][0] ? search["people"] : "No tracks found"  
    end

  end
end