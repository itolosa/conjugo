# typed: false
# frozen_string_literal: true

require "rspec"

RSpec.describe Conjugo::Conjugator do
  context "when past_simple" do
    it "should conjugate to past simple" do
      conjugator = Conjugo::Conjugator.new(subject: "I", verb: "test")
      expect(conjugator.past_simple).to eq("I tested")

      conjugator = Conjugo::Conjugator.new(subject: "I", verb: "take")
      expect(conjugator.past_simple).to eq("I took")
    end
  end
end
