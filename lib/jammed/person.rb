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

    def self.method_missing(name, *args, &block)
      self.profile(args[0]).has_key?(name.to_s) ? self.profile(args[0])[name.to_s] : super
    end
  end
end