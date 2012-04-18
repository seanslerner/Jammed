module Jammed #:nodoc:
  # Provides method for calling API endpoint /suggestedPeople.json?
  class SuggestedPeople
    
    class Search #:nodoc:
      include HTTParty
      base_uri 'http://api.thisismyjam.com/1'
    end
    
    # Calls API for suggested people
    #
    # ==== Examples
    #
    #     Jammed::SuggestedPeople.people #returns a list of users with many followers/likes
    def self.people
      response = Search.get "/suggestedPeople.json?key=#{API_KEY}"
      response["people"][0] ? response["people"] : "No people found"
    end
  end
end