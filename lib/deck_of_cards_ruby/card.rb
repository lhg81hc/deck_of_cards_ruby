module DeckOfCardsRuby
  class Card
    def initialize(rank, suit)
      @suit = Suit.new(suit)
      @rank = Rank.new(rank)
    end

    def to_s
      "#{@rank} of #{@suit}"
    end

    def unicode
      @suit.to_unicode_latitude.sub('x', @rank.to_unicode_longitude)
    end

    def to_encoded_unicode
      unicode.to_i(16).chr('UTF-8')
    end
  end
end
