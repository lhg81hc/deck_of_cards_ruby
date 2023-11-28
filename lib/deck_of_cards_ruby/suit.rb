# frozen_string_literal: true

module DeckOfCardsRuby
  # Class object which represents one of 4 possible suits of a card
  class Suit
    attr_reader :val

    def initialize(val)
      @val = val
      validate
    end

    def validate
      raise "Invalid suit: #{@val}" unless valid_suit?
    end

    def to_s
      @val
    end

    def to_unicode_latitude
      DeckOfCardsRuby::Constants::Suit::UNICODE_LATITUDE[@val]
    end

    private

    def valid_suit?
      DeckOfCardsRuby::Constants::Suit::ACCEPTED_VALUES.include?(@val)
    end
  end
end
