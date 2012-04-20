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
    #     Jammed::PopularJams.popular_jams('08972935872035') #returns a sample of popular jams
    def self.popular_jams(api_key)
      search = Search.get "/popular.json?key=#{api_key}"
      search['jams'] ? search['jams'] : "404 Not Found"
    end
  end
end