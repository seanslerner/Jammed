module Jammed
  # A base class for interacting with the API
  class Base
    attr_reader :api_key

    def initialize(api_key='987bcab01b929eb2c07877b224215c92', opts={})
      @api_key = api_key
    end

    def followers(username, opts={})
      Followers.followers(username, @api_key, opts)
    end

    def folowing(username, opts={})
      Following.following(username, @api_key, opts)
    end

    def jams(username, opts={})
      Jams.jams(username, @api_key, opts)
    end

    def likes(username, opts={})
      Likes.likes(username, @api_key, opts)
    end

    def popular_jams
      PopularJams.popular_jams(@api_key)
    end

    def profile(username)
      Person.profile(username, @api_key)
    end

    def search_name(name)
      PeopleSearch.search_name(name, @api_key)
    end

    def suggested_people
      SuggestedPeople.people(@api_key)
    end

    def user(username)
      User.new(username, @api_key)
    end
  end
end