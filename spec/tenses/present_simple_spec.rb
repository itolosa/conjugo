# typed: ignore
# frozen_string_literal: true

require "rspec"

RSpec.describe Conjugo::Conjugator do
  context "present_simple" do
    it "should be case insensitive" do
      conjugator = Conjugo::Conjugator.new(subject: "I", verb: "test")
      expect(conjugator.present_simple).to eq("I test")

      conjugator = Conjugo::Conjugator.new(subject: "i", verb: "TeSt")
      expect(conjugator.present_simple).to eq("I test")
    end

    it "should conjugate specially for he she it this" do
      %w[He She It This].each do |subject|
        conjugator = Conjugo::Conjugator.new(subject: subject, verb: "test")
        expect(conjugator.present_simple).to eq("#{subject} tests")
      end
    end
  end

  context "present_perfect_negative" do
    it "should conjugate to present simple negative" do
      conjugator = Conjugo::Conjugator.new(subject: "I", verb: "test")
      expect(conjugator.present_simple_negative).to eq("I don't test")
    end

    it "should conjugate for he she it this" do
      %w[He She It This].each do |subject|
        conjugator = Conjugo::Conjugator.new(subject: subject, verb: "test")
        expect(conjugator.present_simple_negative).to eq("#{subject} doesn't test")
      end
    end
  end

  context "present_perfect_question" do
    it "should conjugate for question" do
      conjugator = Conjugo::Conjugator.new(subject: "I", verb: "test")
      expect(conjugator.present_simple_question).to eq("do I test?")
    end

    it "should conjugate for he she it this" do
      %w[He She It This].each do |subject|
        conjugator = Conjugo::Conjugator.new(subject: subject, verb: "test")
        expect(conjugator.present_simple_question).to eq("does #{subject} test?")
      end
    end
  end
end
