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

    describe "#past_jams" do
      it "gets past jams from the api" do
        jam.past_jams.should_not be(nil)
        jam.past_jams.to_s.should include("\"current\"=>false")
      end

      it "doesn't get the current jam" do
        jam.past_jams.to_s.should_not include("\"current\"=>true")
      end
    end

    describe "#current_jam" do
      it "gets the current jam from the api" do
        jam.current_jam.should_not be(nil)
        jam.current_jam.to_s.should include("\"current\"=>true")
      end

      it "doesn't get past jams" do
        jam.current_jam.to_s.should_not include("\"current\"=>false")
      end
    end
  end
end