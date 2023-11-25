# frozen_string_literal: true

module DeckOfCardsRuby
  module Constants
    module Suit
      ACCEPTED_VALUES = %w[hearts diamonds clubs spades].freeze

      UNICODE_LATITUDE = {
        'spades' => '1F0Ax',
        'hearts' => '1F0Bx',
        'diamonds' => '1F0Cx',
        'clubs' => '1F0Dx'
      }.freeze
    end
  end
end
