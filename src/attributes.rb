module Attributes
  %w[
    code
    deck_limit
    faction_code
    flavor
    illustrator
    influence_limit
    keywords
    minimum_deck_size
    pack_code
    position
    quantity
    side_code
    text
    title
    type_code
    uniqueness
    base_link
    cost
    faction_cost
    image_url
    memory_cost
    strength
    advancement_cost
    agenda_points
    trash_cost
  ].each do |attr|
    define_method(attr) do
      self[attr]
    end
  end

  {
    number: :code,
    faction: :faction_code,
    flavour: :flavor,
    artist: :illustrator,
    illus: :illustrator,
    pack: :pack_code,
    side: :side_code,
    card_text: :text,
    type: :type_code,
    unique: :uniqueness,
    unique?: :uniqueness,
    link: :base_link,
    inf: :influence,
    image: :image_url,
    memory: :memory_cost,
    mu: :memory_cost,
    advancement: :advancement_cost,
    advances: :advancement_cost,
    adv: :advancement_cost,
    points: :agenda_points,
    trash: :trash_cost,
    play_cost: :cost,
    rez_cost: :cost,
    rez: :rez,
    answer: :alphanumeric_title
  }.each do |attr_alias, attr|
    define_method(attr_alias) do
      send(attr)
    end
  end

  def subtypes
    (self['keywords'] || '').split(' - ')
  end

  def influence
    self['faction_cost'] || self['influence_limit']
  end

  def number_of_subtypes
    subtypes.count
  end

  def subroutines
    broken_text = (self['text'] || '').split(/^\[subroutine\]|\n\[subroutine\]/)
    return [] unless broken_text.count > 1

    broken_text[1..-1].map(&:strip)
  end

  def number_of_subroutines
    subroutines.count
  end

  def legal?
    !rotated?
  end

  def rotated?
    !StandardFormat::LEGAL_PACKS.include? pack_code.to_sym
  end

  def alphanumeric_title
    I18n.transliterate(title).gsub(/[^A-z0-9]/, '').downcase
  end
end
