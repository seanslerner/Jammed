Given /^I use the username "([^"]*)"$/ do |username|
  @username = username
end

When /^I call the api for "([^"]*)"$/ do |request|
  jam = Jammed::Person.new(@username)
  @return = jam.send request.to_sym
end

Then /^I should receive all the user info$/ do
  @return.to_s.should include(@username)
end

Then /^I should recieve the name$/ do
  @return.to_s.should include(@username)
end

Then /^I should not recieve anything else$/ do
  @return.to_s.should_not include('fullname')
end

Then /^I should recieve an error$/ do
  @return.to_s.should include("404")
end