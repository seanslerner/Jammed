module Jammed #:nodoc:
  # Provides methods for calling API endpoint /jams.json?
  class Jams
    # Calls API for user specific data concerning jams
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
    #     Jammed::Jams.jams('IFTFOM', '08972935872035') #returns all jams
    #     Jammed::Jams.jams('IFTFOM', '08972935872035', :show => :past) # returns only past jams
    def self.jams(username, api_key, opts={})
      case(opts[:show])
      when nil
        jams = Search.get "/#{username}/jams.json?key=#{api_key}"
        jams["jams"] ? jams["jams"] : "404: User Not Found"
      when :past
        jams = Search.get "/#{username}/jams.json?show=past&key=#{api_key}"
        jams["jams"] ? jams["jams"] : "404: User Not Found"
      when :current
        jams = Search.get "/#{username}/jams.json?key=#{api_key}"
        jams["jams"][0]['current'] ? jams["jams"][0] : "No Current Jam"
      end
    end
  end
end
