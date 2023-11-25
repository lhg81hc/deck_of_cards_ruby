# frozen_string_literal: true

module DeckOfCardsRuby
  # Class object which represents one of 13 possible ranks of a card
  class Rank
    def initialize(val)
      @val = val.to_s
      validate
    end

    def validate
      raise 'Invalid rank' unless DeckOfCardsRuby::Constants::Rank::ACCEPTED_VALUES.include?(@val)
    end

    def to_s
      DeckOfCardsRuby::Constants::Rank::TRANSLATIONS[@val]
    end

    def to_unicode_longitude
      DeckOfCardsRuby::Constants::Rank::UNICODE_LONGITUDE[@val]
    end
  end
end
