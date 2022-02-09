# typed: ignore
# frozen_string_literal: true

require "sorbet-runtime"
require_relative "conjugo/version"
require_relative "conjugo/present_simple"
require_relative "conjugo/past_simple"
require_relative "conjugo/errors"
require_relative "conjugo/verbs"
require_relative "conjugo/subjects_and_verbs"

module Conjugo
  class Conjugator
    extend T::Sig

    sig { params(subject: String, verb: String).void }
    def initialize(subject:, verb:)
      raise InvalidSubjectError, "Unrecognized subject" unless valid_subject?(subject)
      raise InvalidVerbError, "Unrecognized verb" unless valid_verb?(verb)

      @subject = T.let(subject.capitalize, String)
      @verb = T.let(all_verbs.fetch(verb.downcase), Verb)
    end
  end
end
