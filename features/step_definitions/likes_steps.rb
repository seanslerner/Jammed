When /^I get their "([^"]*)"$/ do |request|
  case(request)
  when "likes"
    @likes = Jammed::Likes.new(@username).likes
  when "current likes"
    @likes = Jammed::Likes.new(@username).current_likes
  when "past likes"
    @likes = Jammed::Likes.new(@username).past_likes
  end
end

Then /^I should see their "([^"]*)"$/ do |result|
  case(result)
  when "likes"
    @likes.to_s.should include("\"current\"=>true")
    @likes.to_s.should include("\"current\"=>false")
  when "current likes"
    @likes.to_s.should include("\"current\"=>true")
  when "past likes"
    @likes.to_s.should include("\"current\"=>false")
  end
end

Then /^I should not see their "([^"]*)"$/ do |result|
  case(result)
  when "current likes"
    @likes.to_s.should_not include("\"current\"=>true")
  when "past likes"
    @likes.to_s.should_not include("\"current\"=>false")
  end
end