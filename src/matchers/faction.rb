module Matchers
  class Faction < Base
    def self.equals?(card, value)
      case card.faction_code
      when 'anarch'
        %w[anarch a].include? value.to_s
      when 'criminal'
        %w[criminal crim c].include? value.to_s
      when 'shaper'
        %w[shaper s].include? value.to_s
      when 'neutral-runner'
        %w[neutral-runner neutral -].include? value.to_s
      when 'adam'
        %w[adam m].include? value.to_s
      when 'apex'
        %w[apex x].include? value.to_s
      when 'sunny-lebeau'
        %w[sunny-lebeau sunny y].include? value.to_s
      when 'haas-bioroid'
        %w[haas-bioroid hb h].include? value.to_s
      when 'jinteki'
        %w[jinteki j].include? value.to_s
      when 'nbn'
        %w[nbn n].include? value.to_s
      when 'weyland-consortium'
        %w[weyland-consortium weyland w].include? value.to_s
      when 'neutral-corp'
        %w[neutral-corp neutral -].include? value.to_s
      end
    end
  end
end
