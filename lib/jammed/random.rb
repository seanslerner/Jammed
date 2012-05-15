require_relative 'api'

module Jammed #:nodoc:
  # Provides method for calling API endpoint /random.json?
  class RandomJam < API
    # Calls API for a random jam
    #
    # ==== Examples
    #
    #     Jammed::RandomJam.jam('08972935872035') #returns a random jam + the profile of the user
    def self.jam(api_key, https=false)
      response = request(:get, "/random.json", {:https => https,
        :query => {:key => api_key}})
      JSON.parse(response.body)
    end
  end
end