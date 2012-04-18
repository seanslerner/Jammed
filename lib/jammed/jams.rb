module Jammed
  class Jams
    class Search
      include HTTParty
      base_uri 'http://api.thisismyjam.com/1'
    end

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
