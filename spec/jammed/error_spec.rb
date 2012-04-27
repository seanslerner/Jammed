require 'spec_helper'

module Jammed
  describe "Errors" do
    let(:jammed) {Jammed.new('987bcab01b929eb2c07877b224215c92')}
    describe NotFound do 
      before do 
        serve_response("http://api.thisismyjam.com/1/szkjhfkgsufaiuh.json?key=987bcab01b929eb2c07877b224215c92", :not_found, 404)
      end
      it "is raised when unknown username is used" do
        lambda { jammed.profile('szkjhfkgsufaiuh') }.should raise_error NotFound
      end
    end

    describe BadRequest do 
      before do 
        serve_response('http://api.thisismyjam.com/1/IFTFOM.json?badparam=woo&key=987bcab01b929eb2c07877b224215c92', :bad_request, 400)
      end
      it "is raised when bad parameters are used" do
        lambda { API.request(:get, '/IFTFOM.json', 
          :query => {:key => '987bcab01b929eb2c07877b224215c92', 
            :badparam => :woo}) }.should raise_error BadRequest
      end
    end
    
    describe ServerError do 
      before do 
        serve_response("http://api.thisismyjam.com/1/szkjhfkgsufaiuh.json?key=987bcab01b929eb2c07877b224215c92", :not_found, 500)
      end
      it "is raised when the server errors" do
        lambda { jammed.profile('szkjhfkgsufaiuh') }.should raise_error ServerError
      end
    end
  end
end