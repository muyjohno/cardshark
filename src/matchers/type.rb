module Matchers
  class Type < Base
    def self.equals?(card, value)
      card.type_code.match?(/^#{value}$/i)
    end
  end
end
