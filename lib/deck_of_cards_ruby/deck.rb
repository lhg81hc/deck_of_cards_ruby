module DeckOfCardsRuby
  class Deck
    extend Forwardable

    def initialize
      @list = Rank::TRANSLATIONS.keys.product(Suit::ACCEPTED_VALUES).map{ |rank, suit| Card.new(rank, suit) }
    end

    def_delegators :@list, :count, :shuffle!

    def draw
      @list.shift
    end

    def to_s
      @list.map(&:to_s).join(', ')
    end

    def to_unicode
      @list.map(&:to_encoded_unicode).join('  ')
    end
  end
end
