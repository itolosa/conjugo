# typed: ignore
# frozen_string_literal: true

module Conjugo
  class Conjugator
    extend T::Sig

    sig { params(verb: String).returns(T::Boolean) }
    def valid_verb?(verb)
      all_verbs.include?(verb.downcase)
    end

    sig { params(subject: String).returns(T::Boolean) }
    def valid_subject?(subject)
      all_subjects.include?(subject.capitalize)
    end

    sig { returns(T::Array[String]) }
    def all_subjects
      %w[I You He She It This They We]
    end

    sig { returns(T::Hash[String, Verb]) }
    def all_verbs
      {
        "play" => Verb.new(present: "play", past: "played", participle: "played"),
        "sing" => Verb.new(present: "sing", past: "sang", participle: "sung"),
        "work" => Verb.new(present: "work", past: "worked", participle: "worked"),
        "read" => Verb.new(present: "read", past: "read", participle: "read"),
        "write" => Verb.new(present: "write", past: "wrote", participle: "written"),
        "test" => Verb.new(present: "test", past: "tested", participle: "tested"),
        "take" => Verb.new(present: "take", past: "took", participle: "taken")
      }
    end
  end
end
