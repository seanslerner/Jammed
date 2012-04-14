require 'jammed'
require 'webmock/rspec'

SAMPLE_RESPONSES_DIR = "sample_responses"

def serve_response(path, response_file_name)
  begin
    response_body = File.open(File.dirname(__FILE__) + "/#{SAMPLE_RESPONSES_DIR}/#{response_file_name.to_s}.json") {|io| io.read}
  rescue
    raise "Unable to find file [#{response_file_name}.json]"
  end
  
  stub_request(:get, path).to_return(:status => 200, :body => response_body, :headers => {:content_type => 'application/json'})
end