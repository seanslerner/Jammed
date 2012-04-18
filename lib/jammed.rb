require 'httparty'
Dir[File.dirname(__FILE__) + '/jammed/*.rb'].each do |file|
  require file
end

module Jammed
  #Beta API Key (This will be assignable soon)
  API_KEY = '987bcab01b929eb2c07877b224215c92'
end