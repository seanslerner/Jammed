require 'uri'

module Jammed #:nodoc:
  # Provides methods for calling API endpoint /person.json?by=
  class PeopleSearch

    # Calls API for a search by username
    #
    # ==== Attributes
    #
    # * +name+ - Username to search by
    # * +api_key+ - The key to use with the API call
    #
    # ==== Examples
    #
    #     Jammed::PeopleSearch.search_name('IFTFOM', '08972935872035')
    def self.search_name(name, api_key)
      search = Search.get "/search/person.json?by=name&q=#{name.split.join('+')}&key=#{api_key}"
      search["people"][0] ? search["people"] : "No people found"
    end

    # Calls API for a search by artist
    #
    # ==== Attributes
    #
    # * +artist+ - Artist to search by
    # * +api_key+ - The key to use with the API call
    #
    # ==== Examples
    #
    #     Jammed::PeopleSearch.search_artist('beach boys', '08972935872035')
    def self.search_artist(artist, api_key)
      search = Search.get "/search/person.json?by=artist&q=#{artist.split.join('+')}&key=#{api_key}"
      search["people"][0] ? search["people"] : "No artists found"
    end

    # Calls API for a search by track
    #
    # ==== Attributes
    #
    # * +artist+ - Artist to search by
    # * +track+ - Track to search by
    # * +api_key+ - The key to use with the API call
    #
    # ==== Examples
    #
    #     Jammed::PeopleSearch.search_track('beach boys', 'good vibrations', '08972935872035')
    def self.search_track(artist, track, api_key)
      uri = URI.escape("/search/person.json?by=track&q=#{artist.split.join('+')}|#{track.split.join('+')}&key=#{api_key}", '|')
      search = Search.get uri   
      search["people"][0] ? search["people"] : "No tracks found"  
    end

  end
end