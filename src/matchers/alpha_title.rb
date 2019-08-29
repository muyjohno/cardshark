module Matchers
  class AlphaTitle < Base
    def self.equals?(card, value)
      card.alphanumeric_title.match?(/#{value}/i)
    end
  end
end
