module Jammed #:nodoc:
  # Provides methods for calling API endpoint /jams.json?
  class Jams < API
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
        response = request(:get, "/#{username}/jams.json", {:https => opts[:https],
          :query => {:key => api_key}})
        JSON.parse(response.body)['jams']
      when :past
        response = request(:get, "/#{username}/jams.json", {:https => opts[:https],
          :query => {:show => 'past', :key => api_key}})
        JSON.parse(response.body)['jams']
      when :current
        response = request(:get, "/#{username}/jams.json", {:https => opts[:https],
          :query => {:key => api_key}})
        jams = JSON.parse(response.body)['jams'][0]
        jams['current'] ? jams : "No Current Jam"
      end
    end
  end
end
