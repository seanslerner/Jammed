When /^I get their "([^"]*)"$/ do |request|
  case(request)
  when "likes"
    @likes = Jammed::Likes.new(@username).likes
  when "current likes"
    @likes = Jammed::Likes.new(@username).current_likes
  when "past likes"
    @likes = Jammed::Likes.new(@username).past_likes
  when "jams"
    @jams = Jammed::Jams.new(@username).jams
  when "past jams"
    @jams = Jammed::Jams.new(@username).past_jams
  when "current jam"
    @jam = Jammed::Jams.new(@username).current_jam
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
  when "jams"
    @jams.to_s.should include("\"current\"=>true")
    @jams.to_s.should include("\"current\"=>false")
  when "past jams"
    @jams.to_s.should include("\"current\"=>false")
  when "current jam"
    @jam.to_s.should include("\"current\"=>true")
  end
end

Then /^I should not see their "([^"]*)"$/ do |result|
  case(result)
  when "current likes"
    @likes.to_s.should_not include("\"current\"=>true")
  when "past likes"
    @likes.to_s.should_not include("\"current\"=>false")
  when "current jam"
    @jam.to_s.should_not include("\"current\"=>false")
  when "past jams"
    @jams.to_s.should_not include("\"current\"=>true")
  end
end