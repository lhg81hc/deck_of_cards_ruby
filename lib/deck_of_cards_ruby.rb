# frozen_string_literal: true

$LOAD_PATH.unshift File.dirname(__FILE__)

require 'deck_of_cards_ruby/version'
require 'deck_of_cards_ruby/constants/suit'
require 'deck_of_cards_ruby/constants/rank'
require 'deck_of_cards_ruby/card'
require 'deck_of_cards_ruby/deck'
require 'deck_of_cards_ruby/suit'
require 'deck_of_cards_ruby/rank'

module DeckOfCardsRuby
  class Error < StandardError; end
  # Your code goes here...
end
