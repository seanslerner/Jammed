module Jammed
  class Likes
    attr_accessor :username

    include HTTParty

    base_uri 'http://api.thisismyjam.com/1/'

    def initialize(username)
      self.username = username
    end

    def likes
      all_likes = self.class.get "/#{self.username}/likes.json?key=#{API_KEY}"
      all_likes["jams"] ? all_likes["jams"] : "404: User Not Found"
    end

    def current_likes
      current_likes = self.class.get "/#{self.username}/likes.json?show=current&key=#{API_KEY}"
      current_likes["jams"] ? current_likes["jams"] : "404: User Not Found"
    end

    def past_likes
      past_likes = self.class.get "/#{self.username}/likes.json?show=past&key=#{API_KEY}"
      past_likes["jams"] ? past_likes["jams"] : "404: User Not Found"
    end
  end
end