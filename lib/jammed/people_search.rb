require 'uri'

module Jammed #:nodoc:

  class Search #:nodoc:
    include HTTParty
    base_uri 'http://api.thisismyjam.com/1'
  end

  # Provides methods for calling API endpoint /pseron.json?by=
  class PeopleSearch

    # Calls API for a search by username
    #
    # ==== Attributes
    #
    # * +name+ - Username to search by
    #
    # ==== Examples
    #
    #     Jammed::PeopleSearch.search_name('IFTFOM')
    def self.search_name(name)
      search = Search.get "/search/person.json?by=name&q=#{name.split.join('+')}&key=#{API_KEY}"
      search["people"][0] ? search["people"] : "No people found"
    end

    # Calls API for a search by artist
    #
    # ==== Attributes
    #
    # * +artist+ - Artist to search by
    #
    # ==== Examples
    #
    #     Jammed::PeopleSearch.search_artist('beache boys')
    def self.search_artist(artist)
      search = Search.get "/search/person.json?by=artist&q=#{artist.split.join('+')}&key=#{API_KEY}"
      search["people"][0] ? search["people"] : "No artists found"
    end

    # Calls API for a search by track
    #
    # ==== Attributes
    #
    # * +artist+ - Artist to search by
    # * +track+ - Track to search by
    #
    # ==== Examples
    #
    #     Jammed::PeopleSearch.search_track('beach boys', 'good vibrations')
    def self.search_track(artist, track)
      uri = URI.escape("/search/person.json?by=track&q=#{artist.split.join('+')}|#{track.split.join('+')}&key=#{API_KEY}", '|')
      search = Search.get uri   
      search["people"][0] ? search["people"] : "No tracks found"  
    end

  end
end