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
    def self.popular_jams
      Search.get "/popular.json?key=#{API_KEY}"
    end
  end
end