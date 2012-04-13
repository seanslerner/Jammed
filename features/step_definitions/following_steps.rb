When /^I get the users they follow$/ do
  @followings = Jammed::Following.new(@username).following
end

Then /^I should see the users they follow$/ do
  @followings.to_s.should include("TWHarr")
end

When /^I get the users they follow by "([^"]*)"$/ do |order|
  @followings = Jammed::Following.new(@username).following(:order => "#{order}".to_sym)
end

Then /^I should see the users they follow ordered by "([^"]*)"$/ do |order|
  case(order)
  when "date"
    @followings[-1].to_s.should include('TWHarr')
  when "likes"
    @followings.should_not be_nil
  when "alpha"
    @followings[-1].to_s.should include('TWHarr')
  end
end