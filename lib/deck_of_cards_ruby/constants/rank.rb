# frozen_string_literal: true

module DeckOfCardsRuby
  module Constants
    module Rank
      TRANSLATIONS = {
        '2' => 'two',
        '3' => 'three',
        '4' => 'four',
        '5' => 'five',
        '6' => 'six',
        '7' => 'seven',
        '8' => 'eight',
        '9' => 'nine',
        '10' => 'ten',
        'j' => 'jack',
        'q' => 'queen',
        'k' => 'king',
        'a' => 'ace'
      }.freeze

      UNICODE_LONGITUDE = {
        'a' => '1',
        '2' => '2',
        '3' => '3',
        '4' => '4',
        '5' => '5',
        '6' => '6',
        '7' => '7',
        '8' => '8',
        '9' => '9',
        '10' => 'A',
        'j' => 'B',
        'q' => 'D',
        'k' => 'E'
      }.freeze
    end
  end
end
