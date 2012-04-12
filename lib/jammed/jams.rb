module Jammed
  class Jams
    attr_accessor :username

    include HTTParty

    base_uri 'http://api.thisismyjam.com/1/'

    def initialize(username)
      self.username = username
    end

    def jams
      jams = self.class.get "/#{self.username}/jams.json?key=#{API_KEY}"
      jams["jams"] ? jams["jams"] : "404: User Not Found"
    end

    def past_jams
      past_jams = self.class.get "/#{self.username}/jams.json?show=past&key=#{API_KEY}"
      past_jams["jams"] ? past_jams["jams"] : "404: User Not Found"
    end

    def current_jam
      jams = self.class.get "/#{self.username}/jams.json?key=#{API_KEY}"
      return "404: User Not Found" unless jams["jams"]
      jams["jams"][0].to_s.index("\"current\"=>true") ? jams["jams"][0] : "No Current Jam"
    end
  end
end