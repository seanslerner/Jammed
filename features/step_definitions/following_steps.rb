When /^I get the users they follow$/ do
  followings = Jammed::Following.new('IFTFOM')
  serve_response("http://api.thisismyjam.com/1/IFTFOM/following.json?key=987bcab01b929eb2c07877b224215c92", :following)
  @followings = followings.following
end

Then /^I should see the users they follow$/ do
  @followings.should_not be_nil
end

When /^I get the users they follow by "([^"]*)"$/ do |order|
  followings = Jammed::Following.new('IFTFOM')
  case(order)
  when 'date'
    serve_response("http://api.thisismyjam.com/1/IFTFOM/following.json?key=987bcab01b929eb2c07877b224215c92&order=when", :following_when)
    @followings = followings.following(:order => :date)
  when 'affinity'
    serve_response("http://api.thisismyjam.com/1/IFTFOM/following.json?key=987bcab01b929eb2c07877b224215c92&order=affinity", :following_affinity)
    @followings = followings.following(:order => :affinity)
  when 'alpha'
    serve_response("http://api.thisismyjam.com/1/IFTFOM/following.json?key=987bcab01b929eb2c07877b224215c92&order=alpha", :following_alpha)
    @followings = followings.following(:order => :alpha)
  end
end

Then /^I should see the users they follow ordered by "([^"]*)"$/ do |order|
  case(order)
  when "date"
    @followings[-1]["name"].should == "kateconlow"
  when "affinity"
    @followings.should_not be_nil
  when "alpha"
    @followings[-1]["name"].should == "AlexEvans"
  end
end