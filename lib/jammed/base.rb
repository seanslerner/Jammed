module Jammed
  # A base class for interacting with the API
  class Base

    #Stores the API key to be used for all method calls on the Jammed::Base object
    attr_reader :api_key

    #Sets the API key + any options
    def initialize(api_key, opts={})
      @api_key = api_key
    end

    # Calls Jammed::Followers
    #
    # ==== Attributes
    #
    # * +username+ - Username of user whose followers you want to retrieve
    # * +opts+ - Options for ordering Followers data
    #
    # ==== Options
    #
    # * +:order+ - A symbol determining how the data is orderd like :date, :affinity, or :alpha
    #
    # ==== Examples
    #
    #     jammed = Jammed.new('08972935872035') 
    #     jammed.followers('IFTFOM', :order => :date)
    def followers(username, opts={})
      Followers.followers(username, @api_key, opts)
    end

    # Calls Jammed::Following
    #
    # ==== Attributes
    #
    # * +username+ - Username of user whose followings you want to retrieve
    # * +opts+ - Options for ordering Following data
    #
    # ==== Options
    #
    # * +:order+ - A symbol determining how the data is orderd like :date, :affinity, or :alpha
    #
    # ==== Examples
    #
    #     jammed = Jammed.new('08972935872035') 
    #     jammed.following('IFTFOM', :order => :date)
    def folowing(username, opts={})
      Following.following(username, @api_key, opts)
    end

    # Calls Jammed::Jams
    #
    # ==== Attributes
    #
    # * +username+ - Username of user whose jams you want to retrieve
    # * +opts+ - Options for which jams to retrieve
    #
    # ==== Options
    #
    # * +:show+ - A symbol determining which data is shown (:past | :current)
    #
    # ==== Examples
    #
    #     jammed = Jammed.new('08972935872035') 
    #     jammed.jams('IFTFOM', :show => :current)
    def jams(username, opts={})
      Jams.jams(username, @api_key, opts)
    end

    # Calls Jammed::Likes.likes
    #
    # ==== Attributes
    #
    # * +username+ - Username of user whose likes you want to retrieve
    # * +opts+ - Options for which likes to retrieve
    #
    # ==== Options
    #
    # * +:show+ - A symbol determining which data is shown (:past | :current)
    #
    # ==== Examples
    #
    #     jammed = Jammed.new('08972935872035') 
    #     jammed.likes('IFTFOM', :show => :current)
    def likes(username, opts={})
      Likes.likes(username, @api_key, opts)
    end

    # Calls Jammed::PopularJams.popular_jams
    #
    # ==== Examples
    #
    #     jammed = Jammed.new('08972935872035')
    #     jammed.popular_jams
    def popular_jams
      PopularJams.popular_jams(@api_key)
    end

    # Calls Jammed::Person.profile
    #
    # ==== Attributes
    #
    # * +username+ - Username of user profile want to retrieve
    #
    # ==== Examples
    #
    #     jammed = Jammed.new('08972935872035') 
    #     jammed.profile('IFTFOM')
    def profile(username)
      Person.profile(username, @api_key)
    end

    # Calls Jammed::PeopleSearch.search_name
    #
    # ==== Attributes
    #
    # *+name+ - Name you want to search by
    #
    # ==== Examples
    #
    #     jammed = Jammed.new('08972935872035')
    #     jammed.search_name('IFTFOM')
    def search_name(name)
      PeopleSearch.search_name(name, @api_key)
    end

    # Calls Jammed::PeopleSearch.search_artist
    #
    # ==== Attributes
    #
    # *+artist+ - Artist you want to search by
    #
    # ==== Examples
    #
    #     jammed = Jammed.new('08972935872035')
    #     jammed.search_artist('IFTFOM')
    def search_artist(artist)
      PeopleSearch.search_artist(artist, @api_key)
    end

    # Calls Jammed::PeopleSearch.search_track
    #
    # ==== Attributes
    #
    # *+artist+ - Artist you want to search by
    # *+track+ - Track you want to search by
    #
    # ==== Examples
    #
    #     jammed = Jammed.new('08972935872035')
    #     jammed.search_track('IFTFOM')
    def search_track(artist, track)
      PeopleSearch.search_track(artist, track, @api_key)
    end

    # Calls Jammed::SuggestedPeople.people
    #
    # ==== Examples
    #
    #     jammed = Jammed.new('08972935872035')
    #     jammed.suggest_people
    def suggested_people
      SuggestedPeople.people(@api_key)
    end

    # Calls Jammed::User.new and creates a new User object for interacting with user specific data. It provides methods for interacting with user-specific data.
    #
    # ==== Attributes
    #
    # * +username+ - Username of user you want the object oriented with
    #
    # ==== Examples
    #
    #     jammed = Jammed.new('08972935872035') 
    #     ift = jammed.user('IFTFOM')
    #     ift.profile
    #     ift.jams(:show => :past)
    def user(username)
      User.new(username, @api_key)
    end
  end
end