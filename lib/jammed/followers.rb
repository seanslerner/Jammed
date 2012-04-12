module Jammed
  class Followers
    attr_accessor :username

    include HTTParty

    base_uri 'http://api.thisismyjam.com/1/'

    def initialize(username)
      self.username = username
    end

    def followers
      followers = self.class.get "/#{self.username}/followers.json?key=#{API_KEY}"
      followers["people"] ? followers["people"] : "404 Not Found"
    end

    def followers_by_date
      followers = self.class.get "/#{self.username}/followers.json?order=when&key=#{API_KEY}"
      followers["people"] ? followers["people"] : "404 Not Found"
    end

    def followers_by_likes
      followers = self.class.get "/#{self.username}/followers.json?order=likes&key=#{API_KEY}"
      followers["people"] ? followers["people"] : "404 Not Found"
    end

    def followers_by_alpha
      followers = self.class.get "/#{self.username}/followers.json?order=alpha&key=#{API_KEY}"
      followers["people"] ? followers["people"] : "404 Not Found"
    end
  end
end