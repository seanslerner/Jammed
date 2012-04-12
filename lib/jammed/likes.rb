module Jammed
  class Likes
    attr_accessor :username

    include HTTParty

    base_uri 'http://api.thisismyjam.com/1/'

    def initialize(username)
      self.username = username
    end

    def likes
      self.class.get "/#{self.username}/likes.json?key=#{API_KEY}"
    end

    def current_likes
      self.class.get "/#{self.username}/likes.json?show=current&key=#{API_KEY}"
    end

    def past_likes
      self.class.get "/#{self.username}/likes.json?show=past&key=#{API_KEY}"
    end
  end
end