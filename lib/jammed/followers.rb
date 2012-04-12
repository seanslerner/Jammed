module Jammed
  class Followers
    attr_accessor :username

    include HTTParty

    base_uri 'http://api.thisismyjam.com/1/'

    def initialize(username)
      self.username = username
    end

    def followers
    end

    def followers_by_date
    end

    def followers_by_likes
    end

    def followers_by_alpha
    end
  end
end