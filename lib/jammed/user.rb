module Jammed
  class User
    attr_accessor :username

    include HTTParty

    base_uri 'http://api.thisismyjam.com/1/'

    def initialize(username)
      self.username = username
    end

    def profile
      profile = self.class.get "/#{self.username}.json?key=#{API_KEY}"
      profile["person"] ? profile["person"] : "404: User Not Found"
    end

    def method_missing(name, *args, &block)
      profile.has_key?(name.to_s) ? profile[name.to_s] : super
    end
  end
end