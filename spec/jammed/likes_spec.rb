require 'spec_helper'

module Jammed
  describe Likes do 
    let(:like) { Jammed::Likes.new('seanslerner') }
    describe "#likes" do
      it "gets likes from the api" do
        like.likes.should_not be(nil)
      end

      it "gets both current and past likes" do
        like.likes.to_s.should include("\"current\"=>false")
        like.likes.to_s.should include("\"current\"=>true")
      end
    end

    describe "#current_likes" do
      it "gets current likes" do
        like.current_likes.to_s.should include("\"current\"=>true")
      end

      it "doesn't get past likes" do
        like.current_likes.to_s.should_not include("\"current\"=>false")
      end
    end

    describe "#past_likes" do
      it "gets past likes" do
        like.past_likes.to_s.should include("\"current\"=>false")
      end

      it "doesn't get current likes" do
        like.past_likes.to_s.should_not include("\"current\"=>true")
      end
    end
  end
end