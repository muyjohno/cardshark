module Matchers
  class TitleExact < Base
    def self.equals?(card, value)
      card.title.match?(/^#{value}$/i)
    end
  end
end
