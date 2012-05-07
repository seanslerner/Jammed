require_relative 'api'

module Jammed #:nodoc:
  # Provides method for calling API endpoint /suggestedPeople.json?
  class SuggestedPeople < API
    # Calls API for suggested people
    #
    # ==== Examples
    #
    #     Jammed::SuggestedPeople.people('08972935872035') #returns a list of users with many followers/likes
    def self.people(api_key)
      response = request(:get, "/suggestedPeople.json", :query => {:key => api_key})
      JSON.parse(response.body)['people']
    end
  end
end