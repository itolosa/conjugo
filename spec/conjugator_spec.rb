# typed: false
# frozen_string_literal: true

RSpec.describe Conjugo::Conjugator do
  context "initialization" do
    it "has a version number" do
      expect(Conjugo::VERSION).not_to be nil
    end

    it "should not throw if subject is not recognized" do
      %w[I You He She It This They We].each do |subject|
        expect do
          Conjugo::Conjugator.new(subject: subject, verb: "test")
          Conjugo::Conjugator.new(subject: subject.downcase, verb: "test")
        end.not_to raise_error
      end
    end

    it "should throw if subject is not recognized" do
      %w[Ia Yous Hee Shew Itq Thisz Thhey Wee].each do |subject|
        expect do
          Conjugo::Conjugator.new(subject: subject, verb: "test")
        end.to raise_error(Conjugo::Conjugator::InvalidSubjectError,
                           "Unrecognized subject")
      end
    end

    it "should throw if verb is not recognized" do
      expect do
        Conjugo::Conjugator.new(subject: "I", verb: "test_verb")
      end.to raise_error(Conjugo::Conjugator::InvalidVerbError, "Unrecognized verb")
    end

    it "should recognize some valid words" do
      %w[play sing work read write test].each do |verb|
        expect do
          Conjugo::Conjugator.new(subject: "I", verb: verb)
        end.not_to raise_error
      end
    end
  end
end
