module Jammed
  class Followers
    attr_accessor :username

    include HTTParty

    base_uri 'http://api.thisismyjam.com/1/'

    def initialize(username)
      self.username = username
    end

    def followers(opts={})
      case(opts[:order])
      when nil
        followers = self.class.get "/#{self.username}/followers.json?key=#{API_KEY}"
      when :date
        followers = self.class.get "/#{self.username}/followers.json?order=when&key=#{API_KEY}"
      when :affinity
        followers = self.class.get "/#{self.username}/followers.json?order=affinity&key=#{API_KEY}"
      when :alpha
        followers = self.class.get "/#{self.username}/followers.json?order=alpha&key=#{API_KEY}"
      else
        return "Cannot order Followers by #{opts[:order]}"
      end
      followers["people"] ? followers["people"] : "404 Not Found" 
    end
  end
end
