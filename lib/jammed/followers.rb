module Jammed
  class Followers
    class Search
      include HTTParty
      base_uri 'http://api.thisismyjam.com/1'
    end

    def self.followers(username, opts={})
      case(opts[:order])
      when nil
        followers = Search.get "/#{username}/followers.json?key=#{API_KEY}"
      when :date
        followers = Search.get "/#{username}/followers.json?order=when&key=#{API_KEY}"
      when :affinity
        followers = Search.get "/#{username}/followers.json?order=affinity&key=#{API_KEY}"
      when :alpha
        followers = Search.get "/#{username}/followers.json?order=alpha&key=#{API_KEY}"
      else
        return "Cannot order Followers by #{opts[:order]}"
      end
      followers["people"] ? followers["people"] : "404 Not Found" 
    end
  end
end
