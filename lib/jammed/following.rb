module Jammed
  class Following
    attr_accessor :username

    include HTTParty

    base_uri 'http://api.thisismyjam.com/1/'

    def initialize(username)
      self.username = username
    end

    def following(opts={})
      case(opts[:order])
      when nil
        followings = self.class.get "/#{self.username}/following.json?key=#{API_KEY}"
      when :date
        followings = self.class.get "/#{self.username}/following.json?order=when&key=#{API_KEY}"
      when :affinity
        followings = self.class.get "/#{self.username}/following.json?order=affinity&key=#{API_KEY}"
      when :alpha
        followings = self.class.get "/#{self.username}/following.json?order=alpha&key=#{API_KEY}"
      else
        return "Cannot order Followings by #{opts[:order]}"
      end
      followings["people"] ? followings["people"] : "404 Not Found" 
    end

  end
end