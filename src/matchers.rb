module Matchers
  class NotSupportedError < StandardError; end

  MATCHERS = {
    alpha_title: AlphaTitle,
    answer: AlphaTitle,
    crossword: Crossword,
    d: Side,
    f: Faction,
    faction: Faction,
    faction_code: Faction,
    s: Subtype,
    side: Side,
    side_code: Side,
    subtype: Subtype,
    t: Type,
    title: Title,
    title_exact: TitleExact,
    type: Type,
    type_code: Type
  }.freeze

  def match?(attr, filters)
    filters = { equals: filters } unless filters.is_a? Hash

    filters.all? do |op, val|
      raise NotSupportedError unless %i[equals min max not].include?(op)

      op = "#{op}?"

      if MATCHERS.keys.include?(attr.to_sym)
        return MATCHERS[attr.to_sym].send(op, self, val)
      end

      send(op, attr, val)
    end
  end

  def equals?(attr, value)
    send(attr) == value
  end

  def not?(attr, value)
    !equals?(attr, value)
  end

  def min?(attr, value)
    send(attr) && send(attr) >= value
  end

  def max?(attr, value)
    send(attr) && send(attr) <= value
  end
end
