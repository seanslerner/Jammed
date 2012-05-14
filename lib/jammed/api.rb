module Jammed
  # A base class for API calling classes to inherit from which provides a method for making HTTP requests
  class API

    # Call the API through HTTParty and returns the correct error if error raised
    #
    # ==== Attributes
    #
    # * +method+ - HTTP method for making hte request (:get, :post, etc.)
    # * +path+ - Path to API endpoint (/IFTFOM.json)
    # * +opts+ - Query options (API key!) (:show => :past)
    #
    # ==== Examples
    #
    #     Jammed::API.request(:get, /IFTFOM/followers.json, :query => {:key => 'api_key', :order => 'affinity'})
    def self.request(method, path, opts={})
      base_uri = opts[:https] ? 'https://api.thisismyjam.com/1' : 'http://api.thisismyjam.com/1'

      params = {}
      params[:path] = path
      params[:options] = opts
      params[:method] = method

      response = HTTParty.send(method, "#{base_uri}#{path}",
        :query => opts[:query],
        :body => opts[:body],
        :format => :plain,
        :headers => {
          "Accept" => "application/json",
          "Content-Type" => "application/json; charset=utf-8",
          "User-Agent" => "Jammed/#{Jammed::VERSION}"
        }
      )

      params[:response] = response.inspect.to_s

      case response.code
      when 200..201
        response
      when 400
        raise Jammed::BadRequest.new(response, params)
      when 404
        raise Jammed::NotFound.new(response, params)
      when 500
        raise Jammed::ServerError.new(response, params)
      when 502
        raise Jammed::Unavailable.new(response, params)
      when 503
        raise Jammed::RateLimited.new(response, params)
      else
        raise Jammed::InformJammed.new(response, params)
      end
    end
  end
end