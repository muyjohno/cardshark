module Matchers
  class Side < Base
    def self.equals?(card, value)
      case card.side_code
      when 'corp'
        %w[corp c].include? value.to_s
      when 'runner'
        %w[runner r].include? value.to_s
      end
    end
  end
end
