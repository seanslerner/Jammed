module Jammed #:nodoc:
  # Provides method for calling API endpoint /suggestedPeople.json?
  class SuggestedPeople
    # Calls API for suggested people
    #
    # ==== Examples
    #
    #     Jammed::SuggestedPeople.people('08972935872035') #returns a list of users with many followers/likes
    def self.people(api_key)
      response = Search.get "/suggestedPeople.json?key=#{api_key}"
      response["people"][0] ? response["people"] : "No people found"
    end
  end
end