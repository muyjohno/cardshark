module Matchers
  class Subtype < Base
    def self.equals?(card, value)
      card.subtypes.map(&:downcase).include? value.to_s.downcase
    end
  end
end
