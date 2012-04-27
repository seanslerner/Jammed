require 'jammed'
require 'webmock/rspec'

SAMPLE_RESPONSES_DIR = "sample_responses"

def serve_response(path, file_name, status=200)
  begin
    response_body = File.binread(
                      File.dirname(__FILE__) +
                      "/#{SAMPLE_RESPONSES_DIR}/#{file_name.to_s}.json")
  rescue
    raise "Unable to read file [#{file_name}.json]"
  end
  
  stub_request(:get, path)
    .to_return(:status => status, :body => response_body,
                               :headers => {:content_type => 'application/json'})
end