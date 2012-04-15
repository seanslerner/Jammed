When /^I get their "([^"]*)"$/ do |request|
  jam = Jammed::Jams.new('IFTFOM')
  like = Jammed::Likes.new('IFTFOM')
  case(request)
  when "likes"
    serve_response("http://api.thisismyjam.com/1/IFTFOM/likes.json?key=987bcab01b929eb2c07877b224215c92", :likes)
    @likes = like.likes
  when "current likes"
    serve_response("http://api.thisismyjam.com/1/IFTFOM/likes.json?show=current&key=987bcab01b929eb2c07877b224215c92", :likes_current)
    @likes = like.current_likes
  when "past likes"
    serve_response("http://api.thisismyjam.com/1/IFTFOM/likes.json?show=past&key=987bcab01b929eb2c07877b224215c92", :likes_past)
    @likes = like.past_likes
  when "jams"
    serve_response("http://api.thisismyjam.com/1/IFTFOM/jams.json?key=987bcab01b929eb2c07877b224215c92", :jams)
    @jams = jam.jams
  when "past jams"
    serve_response("http://api.thisismyjam.com/1/IFTFOM/jams.json?key=987bcab01b929eb2c07877b224215c92&show=past", :jams_past)
    @jams = jam.jams(:show => :past)
  when "current jam"
    serve_response("http://api.thisismyjam.com/1/IFTFOM/jams.json?key=987bcab01b929eb2c07877b224215c92", :jams)
    @jam = jam.jams(:show => :current)
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