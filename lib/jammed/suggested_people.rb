module Jammed #:nodoc:
  class SuggestedPeople
    
    class Search #:nodoc:
      include HTTParty
      base_uri 'http://api.thisismyjam.com/1'
    end
    
    def self.people
      response = Search.get "/suggestedPeople.json?key=#{API_KEY}"
      response["people"][0] ? response["people"] : "No people found"
    end
  end
end