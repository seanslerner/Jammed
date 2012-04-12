When /^I get their followers$/ do
  @followers = Jammed::Followers.new(@username).followers
end

Then /^I should see who follows them$/ do
  @followers.to_s.should include("TWHarr")
end

When /^I get their followers ordered by "([^"]*)"$/ do |order|
  @followings = Jammed::Followers.new(@username).send("followers_by_#{order}".to_sym)
end

Then /^I should see their followers ordered by "([^"]*)"$/ do |order|
  case(order)
  when "date"
    @followers[-1].to_s.should include('TWHarr')
  when "likes"
  when "alpha"
    @followings[-1].to_s.should include('TWHarr')
  end
end