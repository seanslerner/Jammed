module Jammed #:nodoc:
  # Provides methods for calling API endpoint /jams.json?
  class Jams
    class Search #:nodoc:
      include HTTParty
      base_uri 'http://api.thisismyjam.com/1'
    end

    # Calls API for user specific data concerning jams
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
    #     Jammed::Jams.jams('IFTFOM') #returns all jams
    #     Jammed::Jams.jams('IFTFOM', :show => :past) # returns only past jams
    def self.jams(username, opts={})
      case(opts[:show])
      when nil
        jams = Search.get "/#{username}/jams.json?key=#{API_KEY}"
        jams["jams"] ? jams["jams"] : "404: User Not Found"
      when :past
        jams = Search.get "/#{username}/jams.json?show=past&key=#{API_KEY}"
        jams["jams"] ? jams["jams"] : "404: User Not Found"
      when :current
        jams = Search.get "/#{username}/jams.json?key=#{API_KEY}"
        jams["jams"][0]['current'] ? jams["jams"][0] : "No Current Jam"
      end
    end
  end
end
