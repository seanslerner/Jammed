module Jammed
  class SuggestedPeople
    attr_accessor :people

    include HTTParty

    base_uri 'http://api.thisismyjam.com/1/'

    def people
      @people ||= self.class.get "/suggestedPeople.json?key=#{API_KEY}"
    end

  end
end