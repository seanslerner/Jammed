require 'spec_helper'

module Jammed
  describe Followers do 

    let(:followers) { Jammed::Followers.new('seanslerner') }

    describe "#followers" do
      it "gets followers from the api" do
        followers.followers.should_not be_nil
      end
    end

    describe "#followers(:order => :date)" do
      it "can order followers by date" do
        followers.followers(:order => :date).should_not be_nil
      end
    end

    describe "#followers(:order => :likes)" do
      it "can order followers by likes" do
        followers.followers(:order => :likes).should_not be_nil
      end
    end

    describe "#followers(:order => :alpha)" do
      it "can order followers by alpha" do
        followers.followers(:order => :alpha).should_not be_nil
      end
    end
  end
end