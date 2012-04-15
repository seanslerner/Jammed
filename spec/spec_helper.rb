require 'jammed'
require 'webmock/rspec'

SAMPLE_RESPONSES_DIR = "sample_responses"

def serve_response(path, file_name)
  begin
    response_body = File.binread(
                      File.dirname(__FILE__) +
                      "/#{SAMPLE_RESPONSES_DIR}/#{file_name.to_s}.json")
  rescue
    raise "Unable to read file [#{file_name}.json]"
  end
  
  stub_request(:get, path)
    .to_return(:status => 200, :body => response_body,
                               :headers => {:content_type => 'application/json'})
end