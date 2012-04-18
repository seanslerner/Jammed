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
    # * +opts+ - Options for ordering the data
    #
    # ==== Options
    #
    # * +:order+ - A symbol determining how the data is orderd like :date, :affinity, or :alpha
    #
    # ==== Examples
    #
    #     Jammed::Followers.followers('IFTFOM') #returns followers unorderd
    #     Jammed::Followers.followers('IFTFOM', :order => :date) # returns followers ordered by date
    def self.followers(username, opts={})
      case(opts[:order])
      when nil
        followers = Search.get "/#{username}/followers.json?key=#{API_KEY}"
      when :date
        followers = Search.get "/#{username}/followers.json?order=when&key=#{API_KEY}"
      when :affinity
        followers = Search.get "/#{username}/followers.json?order=affinity&key=#{API_KEY}"
      when :alpha
        followers = Search.get "/#{username}/followers.json?order=alpha&key=#{API_KEY}"
      else
        return "Cannot order Followers by #{opts[:order]}"
      end
      followers["people"] ? followers["people"] : "404 Not Found" 
    end
  end
end
