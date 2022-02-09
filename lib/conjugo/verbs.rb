# typed: ignore
# frozen_string_literal: true

module Conjugo
  class Verb < T::Struct
    const :present, String
    const :past, String
    const :participle, String
  end
end
