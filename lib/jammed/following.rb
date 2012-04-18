module Jammed
  class Following
    class Search
      include HTTParty
      base_uri 'http://api.thisismyjam.com/1'
    end

    def self.following(username, opts={})
      case(opts[:order])
      when nil
        followings = Search.get "/#{username}/following.json?key=#{API_KEY}"
      when :date
        followings = Search.get "/#{username}/following.json?order=when&key=#{API_KEY}"
      when :affinity
        followings = Search.get "/#{username}/following.json?order=affinity&key=#{API_KEY}"
      when :alpha
        followings = Search.get "/#{username}/following.json?order=alpha&key=#{API_KEY}"
      else
        return "Cannot order Followings by #{opts[:order]}"
      end
      followings["people"] ? followings["people"] : "404 Not Found" 
    end
  end
end