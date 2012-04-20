module Jammed #:nodoc:
  # Provides methods for calling API endpoint /following.json?
  class Following
    class Search #:nodoc:
      include HTTParty
      base_uri 'http://api.thisismyjam.com/1'
    end

    # Calls API for user specific data concerning who the user is following
    #
    # ==== Attributes
    #
    # * +username+ - The username of the user whose followings you want to retrieve
    # * +api_key+ - The key to use with the API call
    # * +opts+ - Options for ordering the data
    #
    # ==== Options
    #
    # * +:order+ - A symbol determining how the data is orderd like :date, :affinity, or :alpha
    #
    # ==== Examples
    #
    #     Jammed::Following.following('IFTFOM', '08972935872035') #returns followings unorderd
    #     Jammed::Following.following('IFTFOM', '08972935872035', :order => :date) # returns followings ordered by date
    def self.following(username, api_key, opts={})
      case(opts[:order])
      when nil
        followings = Search.get "/#{username}/following.json?key=#{api_key}"
      when :date
        followings = Search.get "/#{username}/following.json?order=followedDate&key=#{api_key}"
      when :affinity
        followings = Search.get "/#{username}/following.json?order=affinity&key=#{api_key}"
      when :alpha
        followings = Search.get "/#{username}/following.json?order=name&key=#{api_key}"
      else
        return "Cannot order Followings by #{opts[:order]}"
      end
      followings["people"] ? followings["people"] : "404 Not Found" 
    end
  end
end