module Matchers
  class Crossword < Base
    def self.equals?(card, value)
      card.title.match?(
        Regexp.new("^#{value.map { |v| "[a-z]{#{v}}" }.join('[ -]')}$", true)
      )
    end
  end
end
