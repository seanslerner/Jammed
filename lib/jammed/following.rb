module Jammed
  class Following
    attr_accessor :username

    include HTTParty

    base_uri 'http://api.thisismyjam.com/1/'

    def initialize(username)
      self.username = username
    end

    def following
      followings = self.class.get "/#{self.username}/following.json?key=#{API_KEY}"
      followings["people"] ? followings["people"] : "404 Not Found"
    end

    def following_by_date
      followings = self.class.get "/#{self.username}/following.json?order=when&key=#{API_KEY}"
      followings["people"] ? followings["people"] : "404 Not Found"
    end

    def following_by_likes
      followings = self.class.get "/#{self.username}/following.json?order=likes&key=#{API_KEY}"
      followings["people"] ? followings["people"] : "404 Not Found"
    end

    def following_by_alpha
      followings = self.class.get "/#{self.username}/following.json?order=alpha&key=#{API_KEY}"
      followings["people"] ? followings["people"] : "404 Not Found"
    end

  end
end