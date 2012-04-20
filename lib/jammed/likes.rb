module Jammed #:nodoc:
  # Provides methods for calling API endpoint /likes.json?
  class Likes
    class Search #:nodoc:
      include HTTParty
      base_uri 'http://api.thisismyjam.com/1'
    end

    # Calls API for user specific data concerning likes
    #
    # ==== Attributes
    #
    # * +username+ - The username of the user whose followings you want to retrieve
    # * +opts+ - Options for which data is shown
    #
    # ==== Options
    #
    # * +:show+ - A symbol determining what data is shown like :past or :current
    #
    # ==== Examples
    #
    #     Jammed::Likes.likes('IFTFOM') #returns all likes
    #     Jammed::Likes.likes('IFTFOM', :show => :past) # returns only past likes
    def self.likes(username, api_key, opts={})
      case(opts[:show])
      when nil
        likes = Search.get "/#{username}/likes.json?key=#{api_key}"
      when :current
        likes = Search.get "/#{username}/likes.json?show=current&key=#{api_key}"
      when :past
        likes = Search.get "/#{username}/likes.json?show=past&key=#{api_key}"
      end
      likes["jams"] ? likes["jams"] : "404: Not Found"
    end
  end
end