# frozen_string_literal: true

module DeckOfCardsRuby
  # Class object which represents one of 4 possible suits of a card
  class Suit
    ACCEPTED_VALUES = %w[hearts diamonds clubs spades].freeze

    UNICODE_LATITUDE = {
      'spades' => '1F0Ax',
      'hearts' => '1F0Bx',
      'diamonds' => '1F0Cx',
      'clubs' => '1F0Dx'
    }.freeze

    def initialize(val)
      @val = val
      validate
    end

    def validate
      raise 'Invalid suit' unless ACCEPTED_VALUES.include?(@val)
    end

    def to_s
      @val
    end

    def to_unicode_latitude
      UNICODE_LATITUDE[@val]
    end
  end
end
