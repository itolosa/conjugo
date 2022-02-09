# typed: false
# frozen_string_literal: true

module Conjugo
  class Conjugator
    extend T::Sig

    sig { returns(String) }
    def past_simple
      "#{@subject} #{@verb.past}"
    end
  end
end
