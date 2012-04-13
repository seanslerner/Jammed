require 'spec_helper'

module Jammed
  describe Jams do
    let(:jam) { Jammed::Jams.new('seanslerner') }

    describe "#jams" do
      it "gets jams from the api" do
        jam.jams.should_not be(nil)
      end

      it "gets the current jam and past jams" do
        jam.jams.to_s.should include("\"current\"=>false")
        jam.jams.to_s.should include("\"current\"=>true")
      end
    end

    describe "#jams(:show => :past)" do
      it "gets past jams from the api" do
        jam.jams(:show => :past).should_not be(nil)
        jam.jams(:show => :past).to_s.should include("\"current\"=>false")
      end

      it "doesn't get the current jam" do
        jam.jams(:show => :past).to_s.should_not include("\"current\"=>true")
      end
    end

    describe "#jams(:show => :current)" do
      it "gets the current jam from the api" do
        jam.jams(:show => :current).should_not be(nil)
        jam.jams(:show => :current).to_s.should include("\"current\"=>true")
      end

      it "doesn't get past jams" do
        jam.jams(:show => :current).to_s.should_not include("\"current\"=>false")
      end
    end
  end
end
