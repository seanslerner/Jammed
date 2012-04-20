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
    #     Jammed::Person.profile('IFTFOM', '08972935872035') #returns IFTFOM's profile data
    def self.profile(username, api_key)
      profile = Search.get "/#{username}.json?key=#{api_key}"
      profile["person"] ? profile["person"] : "404: User Not Found"
    end

    # Calls API for a specific user's name
    #
    # ==== Examples
    #
    #     Jammed::Person.name('IFTFOM', '08972935872035') #returns 'IFTFOM'
    def self.name(username, api_key)
      self.profile(username, api_key)['name']
    end

    # Calls API for a specific attribute of a user's profile
    #
    # ==== Examples
    #
    #     Jammed::Person.joinedDate('IFTFOM', '08972935872035') #returns IFTFOM's joined date
    def self.method_missing(name, *args, &block)
      self.profile(args[0],args[1]).has_key?(name.to_s) ? self.profile(args[0],args[1])[name.to_s] : super
    end
  end
end