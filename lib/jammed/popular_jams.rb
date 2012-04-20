module Jammed #:nodoc:
  # Provides method for calling API endpoint /popular.json?
  class PopularJams

    class Search #:nodoc:
      include HTTParty
      base_uri 'http://api.thisismyjam.com/1'
    end
    
    # Calls API for popular jams
    #
    # ==== Examples
    #
    #     Jammed::PopularJams.popular_jams #returns a sample of popular jams
    def self.popular_jams(api_key)
      Search.get "/popular.json?key=#{api_key}"
    end
  end
end