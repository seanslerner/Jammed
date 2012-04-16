module Jammed
  class Person

    class Search
      include HTTParty
      base_uri 'http://api.thisismyjam.com/1'
    end

    def self.profile(opts={})
      profile = Search.get "/#{opts[:username]}.json?key=#{API_KEY}"
      profile["person"] ? profile["person"] : "404: User Not Found"
    end

    def method_missing(name, *args, &block)
      self.profile(args).has_key?(name.to_s) ? self.profile(args)[name.to_s] : super
    end
  end
end