# typed: false
# frozen_string_literal: true

module Conjugo
  class Conjugator
    extend T::Sig

    sig { returns(String) }
    def present_simple
      if subject_he_she_it?
        "#{@subject} #{@verb.present}s"
      else
        "#{@subject} #{@verb.present}"
      end
    end

    sig { returns(String) }
    def present_simple_negative
      auxiliary = subject_he_she_it? && "doesn't" || "don't"
      "#{@subject} #{auxiliary} #{@verb.present}"
    end

    sig { returns(String) }
    def present_simple_question
      auxiliary = subject_he_she_it? && "does" || "do"
      "#{auxiliary} #{@subject} #{@verb.present}?"
    end

    private

    def subject_he_she_it?
      %w[He She It This].include?(@subject)
    end
  end
end
