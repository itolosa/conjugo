# typed: strong
# frozen_string_literal: true

module Conjugo
  class Conjugator
    class Error < StandardError; end
    class InvalidSubjectError < Error; end
    class InvalidVerbError < Error; end
  end
end
