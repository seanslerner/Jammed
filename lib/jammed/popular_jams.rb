module Jammed
  class PopularJams
    attr_accessor :popular_jams

    include HTTParty

    base_uri 'http://api.thisismyjam.com/1/'

    def popular_jams
      @popular_jams ||= self.class.get "/popular.json?key=#{API_KEY}"
    end

  end
end