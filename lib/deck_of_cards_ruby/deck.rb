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

    def_delegators :@list, :count, :shuffle!, :shift

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

    def pick(rank, suit)
      return nil unless count.positive?

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
