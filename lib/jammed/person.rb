module Jammed
  class Person

    class Search
      include HTTParty
      base_uri 'http://api.thisismyjam.com/1'
    end

    def self.profile(opts={})
      profile = Search.get "/#{opts[:username]}.json?key=#{API_KEY}"
      profile["person"] ? profile["person"] : "404: User Not Found"
    end
  end
end