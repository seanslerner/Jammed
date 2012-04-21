module Jammed
  class API

    def self.request(method, path, opts={})
      base_uri = 'http://api.thisismyjam.com/1'

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