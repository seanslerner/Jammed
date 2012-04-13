module Jammed
  class Jams
    attr_accessor :username

    include HTTParty

    base_uri 'http://api.thisismyjam.com/1/'

    def initialize(username)
      self.username = username
    end

    def jams(opts={})
      case(opts[:show])
      when nil
        jams = self.class.get "/#{self.username}/jams.json?key=#{API_KEY}"
        jams["jams"] ? jams["jams"] : "404: User Not Found"
      when :past
        jams = self.class.get "/#{self.username}/jams.json?show=past&key=#{API_KEY}"
        jams["jams"] ? jams["jams"] : "404: User Not Found"
      when :current
        jams = self.class.get "/#{self.username}/jams.json?key=#{API_KEY}"
        jams["jams"][0]['current'] ? jams["jams"][0] : "No Current Jam"
      end
    end
  end
end
