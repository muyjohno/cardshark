class Card < SimpleDelegator
  include Attributes
  include Matchers

  ENDPOINT = 'https://netrunnerdb.com/api/2.0/public/cards'.freeze

  def self.load!
    @all_cards = JSON.parse(
      File.read('./data/cards.json')
    ).map { |c| new(c) }

    @all = nil
  end

  def self.update!
    print 'Downloading...'
    data = JSON.parse(Net::HTTP.get(URI(ENDPOINT)))['data'].to_json
    print "Done\nSaving..."
    File.write('./data/cards.json', data)
    print "Done\nReloading..."
    load!
    puts 'Done'
    Card.all.count
  end

  def self.all
    @all ||= CardCollection.new(@all_cards)
  end

  def self.random
    all.sample
  end

  def self.filter(*args, &block)
    all.filter(*args, &block)
  end

  def self.unique
    all.unique
  end

  def self.find(title)
    filter(title_exact: title).first ||
      filter(title: title).first ||
      filter(code: title.to_s).first
  end

  def <=>(other)
    return -1 if !rotated? && other.rotated?
    return 1 if rotated? && !other.rotated?

    code <=> other.code
  end

  def inspect
    "#<Card:\"#{title}\" #{super}>"
  end

  class << self
    alias where filter
  end
end
