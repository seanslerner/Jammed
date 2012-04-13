When /^I get their followers$/ do
  @followers = Jammed::Followers.new(@username).followers
end

Then /^I should see who follows them$/ do
  @followers.to_s.should include("TWHarr")
end

When /^I get their followers ordered by "([^"]*)"$/ do |order|
  @followers = Jammed::Followers.new(@username).followers(:order => "#{order}".to_sym)
end

Then /^I should see their followers ordered by "([^"]*)"$/ do |order|
  case(order)
  when "date"
    @followers[-1].to_s.should include('TWHarr')
  when "likes"
    @followers.should_not be_nil
  when "alpha"
    @followers[-1].to_s.should include('TWHarr')
  end
end
