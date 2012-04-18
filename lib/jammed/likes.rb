module Jammed
  class Likes
    class Search
      include HTTParty
      base_uri 'http://api.thisismyjam.com/1'
    end

    def self.likes(username, opts={})
      case(opts[:show])
      when nil
        likes = Search.get "/#{username}/likes.json?key=#{API_KEY}"
      when :current
        likes = Search.get "/#{username}/likes.json?show=current&key=#{API_KEY}"
      when :past
        likes = Search.get "/#{username}/likes.json?show=past&key=#{API_KEY}"
      end
      likes["jams"] ? likes["jams"] : "404: Not Found"
    end
  end
end