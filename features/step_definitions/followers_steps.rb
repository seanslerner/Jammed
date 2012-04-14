When /^I get their followers$/ do
  followers = Jammed::Followers.new('IFTFOM')
  serve_response("http://api.thisismyjam.com/1/IFTFOM/followers.json?key=987bcab01b929eb2c07877b224215c92", :followers)
  @followers = followers.followers
end

Then /^I should see who follows them$/ do
  @followers.should_not be_nil
end

When /^I get their followers ordered by "([^"]*)"$/ do |order|
  followers = Jammed::Followers.new('IFTFOM')
  case(order)
  when 'date'
    serve_response("http://api.thisismyjam.com/1/IFTFOM/followers.json?key=987bcab01b929eb2c07877b224215c92&order=when", :followers_when)
    @followers = followers.followers(:order => :date)
  when 'affinity'
    serve_response("http://api.thisismyjam.com/1/IFTFOM/followers.json?key=987bcab01b929eb2c07877b224215c92&order=affinity", :followers_affinity)
    @followers = followers.followers(:order => :affinity)
  when 'alpha'
    serve_response("http://api.thisismyjam.com/1/IFTFOM/followers.json?key=987bcab01b929eb2c07877b224215c92&order=alpha", :followers_alpha)
    @followers = followers.followers(:order => :alpha)
  end
end

Then /^I should see their followers ordered by "([^"]*)"$/ do |order|
  case(order)
  when "date"
    @followers.should_not be_nil
  when "affinity"
    @followers.should_not be_nil
  when "alpha"
    @followers.should_not be_nil
  end
end
