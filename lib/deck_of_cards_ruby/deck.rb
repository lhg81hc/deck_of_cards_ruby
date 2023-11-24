# frozen_string_literal: true

require 'forwardable'

module DeckOfCardsRuby
  # Class object which represents a deck of cards
  class Deck
    extend Forwardable

    def initialize
      @list = Rank::TRANSLATIONS.keys.product(Suit::ACCEPTED_VALUES).map do |rank, suit|
        Card.new(rank, suit)
      end
    end

    def_delegators :@list, :count, :shuffle!, :shift, :pop, :empty?

    def remaining
      @list
    end

    def draw(from = 'top')
      case from
      when 'top'
        shift
      when 'bottom'
        pop
      else
        raise "Invalid `from' argument"
      end
    end

    def take_cards(number_of_cards = 1)
      raise "Must take at least 1 card" if number_of_cards < 1

      (1..number_of_cards).to_a.map { |_n| take_a_card }
    end

    def take_a_card
      return nil if empty?

      idx = Random.new.rand(count)
      idx && @list.delete_at(idx)
    end

    def pick(rank, suit)
      return nil if empty?

      wanted = Card.new(rank, suit)
      idx = @list.index { |c| c.rank.to_s == wanted.rank.to_s && c.suit.to_s == wanted.suit.to_s }
      idx && @list.delete_at(idx)
    end

    def to_s
      @list.map(&:to_s).join(', ')
    end

    def to_unicode
      @list.map(&:to_encoded_unicode).join('  ')
    end
  end
end
