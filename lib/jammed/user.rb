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
      n = name.to_s.index('_') != nil ? js_namify(name.to_s) : name.to_s

      profile.has_key?(n) ? profile[n] : super
    end

    def js_namify(name)
      x = []
      name.split('_').each_with_index do |e, i|
        i == 0 ? x << e.downcase : x << e.capitalize
      end
      x.join('')
    end
  end
end