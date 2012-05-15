require_relative 'api'

module Jammed #:nodoc:
  # Provides methods for calling API endpoint /likes.json?
  class Likes < API
    # Calls API for user specific data concerning likes
    #
    # ==== Attributes
    #
    # * +username+ - The username of the user whose followings you want to retrieve
    # * +api_key+ - The key to use with the API call
    # * +opts+ - Options for which data is shown
    #
    # ==== Options
    #
    # * +:show+ - A symbol determining what data is shown like :past or :current
    #
    # ==== Examples
    #
    #     Jammed::Likes.likes('IFTFOM', '08972935872035') #returns all likes
    #     Jammed::Likes.likes('IFTFOM', '08972935872035', :show => :past) # returns only past likes
    def self.likes(username, api_key, opts={})
      case(opts[:show])
      when nil
        response = request(:get, "/#{username}/likes.json", {:https => opts[:https],
          :query => {:key => api_key}})
      when :current
        response = request(:get, "/#{username}/likes.json", {:https => opts[:https],
          :query => {:show => 'current', :key => api_key}})
      when :past
        response = request(:get, "/#{username}/likes.json", {:https => opts[:https],
          :query => {:show => 'past', :key => api_key}})
      end
      JSON.parse(response.body)['jams']
    end
  end
end