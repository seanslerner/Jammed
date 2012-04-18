module Jammed #:nodoc:
  # Provides methods for calling API endpoint /username.json? and accessing user specific data
  class Person

    class Search #:nodoc:
      include HTTParty
      base_uri 'http://api.thisismyjam.com/1'
    end

    # Calls API for a specific user's profile
    #
    # ==== Examples
    #
    #     Jammed::Person.profile(:username => 'IFTFOM') #returns IFTFOM's profile data
    def self.profile(opts={})
      profile = Search.get "/#{opts[:username]}.json?key=#{API_KEY}"
      profile["person"] ? profile["person"] : "404: User Not Found"
    end

    # Calls API for a specific user's name
    #
    # ==== Examples
    #
    #     Jammed::Person.name(:username => 'IFTFOM') #returns 'IFTFOM'
    def self.name(opts={})
      self.profile(opts)['name']
    end

    # Calls API for a specific attribute of a user's profile
    #
    # ==== Examples
    #
    #     Jammed::Person.joinedDate(:username => 'IFTFOM') #returns IFTFOM's joined date
    def self.method_missing(name, *args, &block)
      self.profile(args[0]).has_key?(name.to_s) ? self.profile(args[0])[name.to_s] : super
    end
  end
end