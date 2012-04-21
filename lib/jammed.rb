require 'httparty'
require 'json'
Dir[File.dirname(__FILE__) + '/jammed/*.rb'].each do |file|
  require file
end

module Jammed

  class Search #:nodoc:
    include HTTParty
    base_uri 'http://api.thisismyjam.com/1'
  end
  
  class << self
    #Creates a Jammed::Base object for interacting with the API
    #
    # ==== Attributes
    #
    # * +api_key+ - Sets the API key to use for all calls made with object
    # * +opts+ -Options hash. Does nothing at the moment.
    #
    # ==== Examples
    #
    #     jammed = Jammed.new('987bcab01b929eb2c07877b224215c92')
    def new(api_key='987bcab01b929eb2c07877b224215c92', opts={})
      Jammed::Base.new(api_key, opts)
    end
  end
end