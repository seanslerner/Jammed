require_relative 'api'

module Jammed #:nodoc: 
  # Provides methods for calling API endpoint /follower.json?
  class Followers < API
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
        response = request(:get, "/#{username}/followers.json", {:https => opts[:https], 
          :query => {:key => api_key}})
      when :date
        response = request(:get, "/#{username}/followers.json", {:https => opts[:https],
          :query => {:order => 'followedDate', :key => api_key}})
      when :affinity
        response = request(:get, "/#{username}/followers.json", {:https => opts[:https],
          :query => {:order => 'affinity', :key => api_key}})
      when :alpha
        response = request(:get, "/#{username}/followers.json", {:https => opts[:https],
          :query => {:order => 'name', :key => api_key}})
      else
        return "Cannot order Followers by #{opts[:order]}"
      end
      JSON.parse(response.body)['people']
    end
  end
end
