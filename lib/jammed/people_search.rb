require_relative 'api'
require 'uri'

module Jammed #:nodoc:
  # Provides methods for calling API endpoint /person.json?by=
  class PeopleSearch < API

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
    def self.search_name(name, api_key, https=false)
      response = request(:get, "/search/person.json", {:https => https,
          :query => {:by => 'name', :q => "#{name.split.join('+')}", :key => api_key}})
      JSON.parse(response.body)['people']
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
    def self.search_artist(artist, api_key, https=false)
      response = request(:get, "/search/person.json", {:https => https,
          :query => {:by => 'artist', :q => "#{artist.split.join('+')}", :key => api_key}})
      JSON.parse(response.body)['people']
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
    def self.search_track(artist, track, api_key, https=false)
      response = request(:get, "/search/person.json", {:https => https,
          :query => {:by => 'track', 
                     :q => "#{artist.split.join('+')}|#{track.split.join('+')}",
                     :key => api_key}})
      JSON.parse(response.body)['people'] 
    end

  end
end