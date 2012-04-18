module Jammed
  class PopularJams

    class Search
      include HTTParty
      base_uri 'http://api.thisismyjam.com/1'
    end

    def self.popular_jams
      Search.get "/popular.json?key=#{API_KEY}"
    end
  end
end