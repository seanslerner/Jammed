Given /^I use the username "([^"]*)"$/ do |username|
  @username = username
end

When /^I call the api for "([^"]*)"$/ do |request|
  person = Jammed::Person.new(@username)
  case(request)
  when 'profile'
    serve_response("http://api.thisismyjam.com/1/#{@username}.json?key=987bcab01b929eb2c07877b224215c92", :person)
    @return = person.profile
  when 'name'
    serve_response("http://api.thisismyjam.com/1/#{@username}.json?key=987bcab01b929eb2c07877b224215c92", :person)
    @return = person.name
  end
end

Then /^I should receive all the user info$/ do
  @return.should_not be_nil
end

Then /^I should recieve the name$/ do
  @return.to_s.should include(@username)
end

Then /^I should not recieve anything else$/ do
  @return.to_s.should_not include('fullname')
end

Then /^I should recieve an error$/ do
  @return.to_s.should_not include('ThisUserNameShouldNeverExist')
end
