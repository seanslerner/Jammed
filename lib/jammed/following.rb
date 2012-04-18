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
    # * +opts+ - Options for ordering the data
    #
    # ==== Options
    #
    # * +:order+ - A symbol determining how the data is orderd like :date, :affinity, or :alpha
    #
    # ==== Examples
    #
    #     Jammed::Following.following('IFTFOM') #returns followings unorderd
    #     Jammed::Following.following('IFTFOM', :order => :date) # returns followings ordered by date
    def self.following(username, opts={})
      case(opts[:order])
      when nil
        followings = Search.get "/#{username}/following.json?key=#{API_KEY}"
      when :date
        followings = Search.get "/#{username}/following.json?order=followedDate&key=#{API_KEY}"
      when :affinity
        followings = Search.get "/#{username}/following.json?order=affinity&key=#{API_KEY}"
      when :alpha
        followings = Search.get "/#{username}/following.json?order=name&key=#{API_KEY}"
      else
        return "Cannot order Followings by #{opts[:order]}"
      end
      followings["people"] ? followings["people"] : "404 Not Found" 
    end
  end
end