class CardCollection < SimpleDelegator
  def initialize(*args)
    super(*args)
    sort
  end

  def filter(filters = {})
    self.class.new(
      if block_given?
        select do |c|
          yield c
        end
      else
        apply_filters(filters)
      end
    )
  end

  alias where filter

  def apply_filters(filters)
    filters.reduce(self) do |collection, (k, v)|
      collection.select { |c| c.match? k.to_s, v }
    end
  end

  def pluck(attr)
    map { |c| c.send(attr) }
  end

  def titles
    pluck(:title)
  end

  def unique
    self.class.new(
      each_with_object({}) do |card, unique_cards|
        unique_cards[card.title] = card
      end.values
    )
  end

  def legal
    where(legal?: true)
  end

  def random
    sample
  end
end
