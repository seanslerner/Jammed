module Jammed
  class User
    attr_accessor :username, :profile

    def initialize(username)
      @username = username
    end
    
    def profile
      @profile ||= Jammed::Person.profile(:username => @username)
    end

    def profile!
      @profile = Jammed::Person.profile(:username => @username)
    end

    def method_missing(name, *args, &block)
      profile.has_key?(name.to_s) ? profile[name.to_s] : super
    end
  end
end