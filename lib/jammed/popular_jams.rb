module Jammed #:nodoc:
  # Provides method for calling API endpoint /popular.json?
  class PopularJams < API
    # Calls API for popular jams
    #
    # ==== Examples
    #
    #     Jammed::PopularJams.popular_jams('08972935872035') #returns a sample of popular jams
    def self.popular_jams(api_key, https=false)
      response = request(:get, "/popular.json", {:https => https, :query => {:key => api_key}})
      JSON.parse(response.body)['jams']
    end
  end
end