module Matchers
  class Title < Base
    def self.equals?(card, value)
      I18n.transliterate(card.title).match?(/#{value}/i)
    end
  end
end
