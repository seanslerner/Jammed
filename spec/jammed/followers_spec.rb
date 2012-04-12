require 'spec_helper'

module Jammed
  describe Followers do 

    let(:followers) { Jammed::Followers.new('seanslerner') }

    describe "#followers" do
      it "gets followers from the api" do
        followers.followers.should_not be_nil
      end
    end

    describe "#followers_by_date" do
      it "order followers by date" do
        followers.followers('date').should_not be_nil
      end
    end

    describe "#followers_by_likes" do
      it "order followers by likes" do
        followers.followers('likes').should_not be_nil
      end
    end

    describe "#followers_by_alpha" do
      it "order followers by alpha" do
        followers.followers('alpha').should_not be_nil
      end
    end
  end
end