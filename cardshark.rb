require 'date'
require 'forwardable'
require 'i18n'
require 'json'
require 'net/http'

require 'pry'

require './src/matchers/base'
Dir[File.dirname(__FILE__) + '/src/matchers/*.rb'].each { |file| require file }

I18n.available_locales = [:en]

require_relative 'src/attributes'
require_relative 'src/standard_format'
require_relative 'src/matchers'
require_relative 'src/card'
require_relative 'src/card_collection'

Card.load!

# class Cardshark
#   attr_reader :all_decks, :all_cards
#   ENDPOINT = 'https://netrunnerdb.com/api/2.0/public/decklists/by_date/'.freeze
#
#   def initialize
#     @all_decks = []
#     @all_cards = Cardshark.cards
#   end
#
#   def dates
#     Date.new(2018, 1, 1)..Date.today
#   end
#
#   def url(date)
#     URI("#{ENDPOINT}#{date.strftime('%F')}")
#   end
#
#   def get_decks_for_date(date)
#     JSON.parse(Net::HTTP.get(url(date)))['data']
#   end
#
#   def pull_decks
#     @all_decks += get_decks_for_date(Date.new(2018, 1, 1))
#   end
# end
