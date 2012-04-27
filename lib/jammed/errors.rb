module Jammed
  class HTTPError < StandardError #:nodoc: 
    attr_reader :response
    attr_reader :params

    def initialize(response, params = {})
      @response = response
      @params = params
      super(response)
    end
    
    def to_s
      "#{self.class.to_s} : #{response.code} #{response.body}"
    end
  end

  class RateLimited < HTTPError#:nodoc: 
  end
  class NotFound < HTTPError#:nodoc: 
  end
  class Unavailable < HTTPError#:nodoc: 
  end
  class InformJammed < HTTPError#:nodoc: 
  end
  class BadRequest < HTTPError#:nodoc: 
  end
  class ServerError < HTTPError
  #:nodoc: end
end