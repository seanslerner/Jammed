$LOAD_PATH << File.expand_path('../../../lib', __FILE__)
require 'jammed'
require 'webmock/cucumber'

SAMPLE_RESPONSES_DIR = "sample_responses"

def serve_response(path, response_file_name)
  begin
    response_body = File.open(File.dirname(__FILE__) + "/../../spec/#{SAMPLE_RESPONSES_DIR}/#{response_file_name.to_s}.json") {|io| io.read}
  rescue
    raise "Unable to find file [#{response_file_name}.json]"
  end
  
  stub_request(:get, path).to_return(:status => 200, :body => response_body, :headers => {:content_type => 'application/json'})
end