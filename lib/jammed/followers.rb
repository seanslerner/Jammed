module Jammed #:nodoc: 
  # Provides methods for calling API endpoint /follower.json?
  class Followers
    class Search #:nodoc:
      include HTTParty
      base_uri 'http://api.thisismyjam.com/1'
    end

    # Calls API for user specific data concerning followers
    #
    # ==== Attributes
    #
    # * +username+ - The username of the user whose followers you want to retrieve
    # * +api_key+ - The key to use with the API call
    # * +opts+ - Options for ordering the data
    #
    # ==== Options
    #
    # * +:order+ - A symbol determining how the data is orderd like :date, :affinity, or :alpha
    #
    # ==== Examples
    #
    #     Jammed::Followers.followers('IFTFOM', '08972935872035') #returns followers unorderd
    #     Jammed::Followers.followers('IFTFOM', '08972935872035', :order => :date) # returns followers ordered by date
    def self.followers(username, api_key, opts={})
      case(opts[:order])
      when nil
        followers = Search.get "/#{username}/followers.json?key=#{api_key}"
      when :date
        followers = Search.get "/#{username}/followers.json?order=followedDate&key=#{api_key}"
      when :affinity
        followers = Search.get "/#{username}/followers.json?order=affinity&key=#{api_key}"
      when :alpha
        followers = Search.get "/#{username}/followers.json?order=name&key=#{api_key}"
      else
        return "Cannot order Followers by #{opts[:order]}"
      end
      followers["people"] ? followers["people"] : "404 Not Found" 
    end
  end
end
