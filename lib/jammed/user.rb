module Jammed #:nodoc:
  # Provides User objects for interacting with user-specific data
  class User
    
    # Each attr_accessor (except for :username) caches API data on first use in corresponding instance variable
    attr_accessor :username, :followers, :following, :jams, :likes, :profile

    # Creates a new Jammed::User object and assigns a username to @username
    #
    # ==== Attributes
    #
    # * +username+ - Username of user to make API calls with
    #
    # ==== Examples
    #
    #       iftfom = Jammed::User.new('IFTFOM', '08972935872035')
    def initialize(username, api_key, https=false)
      @username = username
      @api_key = api_key
      @https = https
    end

    def followers(opts={})
      opts = opts.merge({:https => @https})
      @followers ||= Jammed::Followers.followers(@username, @api_key, opts)
    end

    # Clears cached Followers data with a fresh call to Jammed::Followers
    #
    # ==== Attributes
    #
    # * +opts+ - Options for ordering Followers data
    #
    # ==== Options
    #
    # * +:order+ - A symbol determining how the data is orderd like :date, :affinity, or :alpha
    #
    # ==== Examples
    #
    #     user = Jammed::User.new('IFTFOM', '08972935872035')
    #     user.followers #returns all followers of IFTFOM
    #     user.followers(:order => :date) #reutrns IFTFOM's followers ordered by date
    def followers!(opts={})
      opts = opts.merge({:https => @https})
      @followers = Jammed::Followers.followers(@username, @api_key, opts)
    end

    def following(opts={})
      opts = opts.merge({:https => @https})
      @following ||= Jammed::Following.following(@username, @api_key, opts)
    end

    # Clears cached Following data with a fresh call to Jammed::Following
    #
    # ==== Attributes
    #
    # * +opts+ - Options for ordering Following data
    #
    # ==== Options
    #
    # * +:order+ - A symbol determining how the data is orderd like :date, :affinity, or :alpha
    #
    # ==== Examples
    #
    #     user = Jammed::User.new('IFTFOM', '08972935872035')
    #     user.following #returns all followings of IFTFOM
    #     user.following(:order => :date) #returns IFTFOM's followings ordered by date
    def following!(opts={})
      opts = opts.merge({:https => @https})
      @following = Jammed::Following.following(@username, @api_key, opts)
    end

    def jams(opts={})
      opts = opts.merge({:https => @https})
      @jams ||= Jammed::Jams.jams(@username, @api_key, opts)
    end

    # Clears cached Jams data with a fresh call to Jammed::Jams
    #
    # ==== Attributes
    #
    # * +opts+ - Options for which data is shown
    #
    # ==== Options
    #
    # * +:show+ - A symbol determining what data is shown like :past or :current
    #
    # ==== Examples
    #
    #     user = Jammed::User.new('IFTFOM', '08972935872035')
    #     user.jams #returns all jams of IFTFOM
    #     user.jams(:show => :past) #returns IFTFOM's past jams
    def jams!(opts={})
      opts = opts.merge({:https => @https})
      @jams = Jammed::Jams.jams(@username, @api_key, opts)
    end

    def likes(opts={})
      opts = opts.merge({:https => @https})
      @likes ||= Jammed::Likes.likes(@username, @api_key, opts)
    end

    # Clears cached Likes data with a fresh call to Jammed::Likes
    #
    # ==== Attributes
    #
    # * +opts+ - Options for which data is shown
    #
    # ==== Options
    #
    # * +:show+ - A symbol determining what data is shown like :past or :current
    #
    # ==== Examples
    #
    #     user = Jammed::User.new('IFTFOM', '08972935872035')
    #     user.likes #returns all likes of IFTFOM
    #     user.likes(:show => :past) #returns IFTFOM's past likes
    def likes!(opts={})
      opts = opts.merge({:https => @https})
      @likes = Jammed::Likes.likes(@username, @api_key, opts)
    end
    
    def profile
      @profile ||= Jammed::Person.profile(@username, @api_key, @https)
    end

    # Clears cached Person data with a fresh call to Jammed::Person
    #
    # ==== Examples
    #
    #     user = Jammed::User.new('IFTFOM', '08972935872035')
    #     user.profile #returns entire profile of IFTFOM
    def profile!
      @profile = Jammed::Person.profile(@username, @api_key, @https)
    end

    # Checks user's profile for attribute and returns value if attribute key is found.
    #
    # ==== Examples
    #
    #     user = Jammed::User.new('IFTFOM', '08972935872035')
    #     user.name #returns 'IFTFOM'
    #     user.date_joined #uses js_namify to find 'dateJoined' key and returns date
    def method_missing(name, *args, &block)
      n = name.to_s.index('_') != nil ? js_namify(name.to_s) : name.to_s

      profile.has_key?(n) ? profile[n] : super
    end

    # Converts Ruby styled method names to JavaScript's prefered style. Used by method_missing to generate dynamic attributes methods for user's profile.
    #
    # ==== Attributes
    #
    # * +name+ - Method name to be converted
    #
    # ==== Examples
    #
    #     js_namify('date_joined') #returns 'dateJoined'
    def js_namify(name)
      x = []
      name.split('_').each_with_index do |e, i|
        i == 0 ? x << e.downcase : x << e.capitalize
      end
      x.join('')
    end
  end
end